class Nanoc3::Item 
  # Will be in future version of nanoc. Delete if needed.
  def compiled_content(opts = {}) 
    opts[:rep] ||= :default 
    opts[:snapshot] ||= :last 
    reps.find { |r| r.name == opts[:rep] }.content_at_snapshot(opts[:snapshot]) 
  end
end


# will be in nanoc > 3.0.7
module Nanoc3::Helpers::Blogging
    alias atom_feed_ atom_feed

    def atom_feed(params={})
      require 'builder'
      require 'time'
 
      # Extract parameters
      limit = params[:limit] || 5
      relevant_articles = params[:articles] || articles || []
      content_proc = params[:content_proc] || lambda { |a| a.reps[0].content_at_snapshot(:pre) }
      excerpt_proc = params[:excerpt_proc] || lambda { |a| a[:excerpt] }
 
      # Check config attributes
      if @site.config[:base_url].nil?
        raise RuntimeError.new('Cannot build Atom feed: site configuration has no base_url')
      end
 
      # Check feed item attributes
      if @item[:title].nil?
        raise RuntimeError.new('Cannot build Atom feed: feed item has no title')
      end
      if @item[:author_name].nil?
        raise RuntimeError.new('Cannot build Atom feed: feed item has no author_name')
      end
      if @item[:author_uri].nil?
        raise RuntimeError.new('Cannot build Atom feed: feed item has no author_uri')
      end
 
      # Check article attributes
      if relevant_articles.empty?
        raise RuntimeError.new('Cannot build Atom feed: no articles')
      end
      if relevant_articles.any? { |a| a[:created_at].nil? }
        raise RuntimeError.new('Cannot build Atom feed: one or more articles lack created_at')
      end
 
      # Get sorted relevant articles
      sorted_relevant_articles = relevant_articles.sort_by { |a| Time.parse(a[:created_at]) }.reverse.first(limit)
 
      # Get most recent article
      last_article = sorted_relevant_articles.first
 
      # Create builder
      buffer = ''
      xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)
 
      # Build feed
      xml.instruct!
      xml.feed(:xmlns => 'http://www.w3.org/2005/Atom') do
        root_url = @site.config[:base_url] + '/'
 
        # Add primary attributes
        xml.id root_url
        xml.title @item[:title]
 
        # Add date
        xml.updated Time.parse(last_article[:created_at]).to_iso8601_time
 
        # Add links
        xml.link(:rel => 'alternate', :href => root_url)
        xml.link(:rel => 'self', :href => feed_url)
 
        # Add author information
        xml.author do
          xml.name @item[:author_name]
          xml.uri @item[:author_uri]
        end
 
        # Add articles
        sorted_relevant_articles.each do |a|
          # Get URL
          url = url_for(a)
          next if url.nil?
 
          xml.entry do
            # Add primary attributes
            xml.id atom_tag_for(a)
            xml.title a[:title], :type => 'html'
 
            # Add dates
            xml.published Time.parse(a[:created_at]).to_iso8601_time
            xml.updated a.mtime.to_iso8601_time
 
            # Add link
            xml.link(:rel => 'alternate', :href => url)
 
            # Add content
            summary = excerpt_proc.call(a)
            xml.content content_proc.call(a), :type => 'html'
            xml.summary summary, :type => 'html' unless summary.nil?
          end
        end
      end
 
      buffer
    end
end


class Array
  def to_hash_keys(&block)
    Hash[*self.collect { |v|
      [v, block.call(v)]
    }.flatten]
  end

  def to_hash_values(&block)
    Hash[*self.collect { |v|
      [block.call(v), v]
    }.flatten]
  end
end
