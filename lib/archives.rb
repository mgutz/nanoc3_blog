# This is too complicated to do in HAML (mainly because of indentation)
def render_archives
  html = ""
  current_year = nil
  current_month = nil
  
  sorted_articles.each do |item|
    d = Date.parse(item[:created_at])
    if current_year != d.year
      html += "</ul></div>" if current_month
      html += "</div>" if current_year
      current_year = d.year
      current_month = nil
      html += "<div class='year'><h2>#{d.year}</h2>"
    end

    if current_month != d.month
      html += "</ul></div>" if current_month
      current_month = d.month
      html += "<div class='month'><h2>#{d.strftime("%B")}</h2>"
      html += "<ul class='medium-links'>"
    end
    
    html += "<li><a href='#{route_path(item)}'>#{item[:title]}</a></li>"
  end
  
  # close tags
  html += "</ul></div>" if current_month
  html += "</div>" if current_year
end