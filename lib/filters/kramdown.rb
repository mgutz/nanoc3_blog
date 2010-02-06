# Will be in nanoc3 >= 3.1
module Nanoc3::Filters
  class Kramdown < Nanoc3::Filter
    def run(content, params={})
      require 'kramdown'
      ::Kramdown::Document.new(content, params).to_html
    end
  end

  Nanoc3::Filter.register '::Nanoc3::Filters::Kramdown', :kramdown
end
