include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering


# Hyphens are converted to sub-directories in the output folder. 
def route_path(item)
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


def pre_content(identifier)
  items ||= @items
  item = items.find { |item| item.identifier == identifier }
  item.compiled_content(:snapshot => :pre) 
end


def dated_items
  items ||= @items
  items.find_all { |item| starts_with_date?(item) }
end


def items_by_date(count=nil)
  h = dated_items.to_hash_values { |item| route_to_date(route_path(item)) }

  desc = h.sort_by { |date, item| date }
  arr = desc.map { |date_item| date_item[1] }
end


private

def route_to_date(r)
  date = r.split('/')[1,3].join('/')
  Date.strptime(date, "%Y/%m/%d")
end

def starts_with_date?(item)
  r = route_path(item)
  parts = r.split('/')[1,3]
  Date.valid_date?(parts[0].to_i, parts[1].to_i, parts[2].to_i)
end