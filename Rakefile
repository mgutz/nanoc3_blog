require 'nanoc3/tasks'
require 'fileutils'
require 'active_support/core_ext'

namespace :create do
  @now = Time.now

  desc "Creates a new article"
  task :article do
    if !ENV['title']
      $stderr.puts "\t[error] Missing title argument.\n\tusage: rake create:article title='article title'"
      exit 1
    end

    title = ENV['title'].capitalize
    path, filename, full_path = calc_path(title)

    if File.exists?(full_path)
      $stderr.puts "\t[error] Exists #{full_path}"
      exit 1
    end

    template = <<TEMPLATE
---
created_at: #{@now.strftime("%Y/%m/%d")}
excerpt: 
kind: article
publish: true
tags: [misc]
title: "#{title.titleize}"
---

TODO: Add content to `#{full_path}.`
TEMPLATE

    FileUtils.mkdir_p(path) if !File.exists?(path)
    File.open(full_path, 'w') { |f| f.write(template) }
    $stdout.puts "\t[ok] Edit #{full_path}"
  end

  def calc_path(title)
    path = "content/" + @now.strftime("%Y/") 
    filename = @now.strftime("%m-%d-") + title.parameterize('_') + ".md"
    # remove special characters
    filename.gsub!(/[:\/\\!\"\']/, '')

    [path, filename, path + filename]
  end
end
