include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering


# Used by routing rule to convert items to outputs. 
# Hyphens are converted to sub-directories in the output folder. 
def output_path(item)
  if item.identifier.include?('-')
    item.identifier.split('-').join('/').chop + '.html' # /2010/01/01-some_title.haml -> /2010/01/01/some_title.html
  else
    item.identifier + 'index.html'                      # /2010/ => /2010/index.html
  end
end