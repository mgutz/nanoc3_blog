require 'yaml'
require 'digest/md5'

module MGutz

  # Tracks a file's last content change using MD5.
  #
  # File.mtime is not sufficient to detect if content has been updated. This
  # class will set `updated_at` if it detects a change in the content
  # irregardless of the file's mtime.
  #
  # Values are stored in `file_changes.yaml` by default.
  #
  class FileChanges
    def initialize(store_filename = "file_changes.yaml")
      @store_filename = store_filename

      if File.exists?(@store_filename)
        @changes = YAML.load_file(@store_filename)
      else
        @changes = {}
      end

    end

    # Gets a file's status change.
    #
    # filename - Name of the file
    # created_at - Optional. Use this date if change status not yet recorded.
    # content - Optional. Content of the file (if it has already been read).
    #
    # returns { :created_at => '', :updated_at => '', :hash = ''}
    #
    def status(filename, created_at = nil, content = nil)
      content ||= File.readlines(filename)
      md5 = Digest::MD5.hexdigest(content)
      item = @changes[filename.to_sym]
      write = false

      if item && item[:hash] != hash
        item[:updated_at] = File.mtime(filename)
        item[:md5] = md5
        write_changes
      else
        item = {}
        item[:created_at] = created_at || File.ctime(filename)
        item[:updated_at] = File.mtime(filename)
        item[:md5] = md5
        @changes[filename.to_sym] = item
        write_changes
      end

      item
    end

  private

    def write_changes
      File.open(@store_filename, 'w') do |f|
        YAML.dump @changes, f 
      end
    end
  end
end
