include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering


# Hyphens are converted to sub-directories in the output folder. 
def url_for(item)
  if item.identifier.include?('-')
    item.identifier.split('-').join('/').chop + '.html' # /2010/01/01-some_title.haml -> /2010/01/01/some_title.html
  else
    item.identifier + 'index.html'                      # /2010/ => /2010/index.html
  end
end


# Creates tag pages from partial: layouts/_tag_page.haml
def create_tag_pages
  tag_set(items).each do |tag|
    items << Nanoc3::Item.new(
      "= render('_tag_page', :tag => '#{tag}')", # use locals to pass data
      { :title => "Category: #{tag}" },      # attributes
      "/tags/#{tag}/"                        # identifier
    )
  end
end