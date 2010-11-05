# from this thread: http://groups.google.com/group/nanoc/browse_thread/thread/caefcab791fd3c4b

module TaggingExtra

  require 'set'

  #Returns all the tags present in a collection of items.
  #The tags are only present once in the returned value.
  #When called whithout parameters, all the site items
  #are considered.
  def tag_set(items=nil) 
    items = @items if items.nil?
    tags = Set.new
    items.each do |item|
      next if item[:tags].nil?
      item[:tags].each { |tag| tags << tag }
    end
    tags.to_a
  end

  #Return true if an items has a specified tag
  def has_tag?(item, tag)
    return false if item[:tags].nil?
    item[:tags].include? tag
  end

  #Finds all the items having a specified tag.
  #By default the method search in all the site
  #items. Alternatively, an item collection can
  #be passed as second (optional) parameter, to
  #restrict the search in the collection.
  def items_with_tag(tag, items=nil)
    items = @items if items.nil?
    items.select { |item| has_tag?( item, tag ) }
  end
  
  #Count the tags in a given collection of items.
  #By default, the method counts tags in all the
  #site items.
  #The result is an hash such as: { tag => count }.
  def count_tags(items=nil)
    items = @items if items.nil?
    count = Hash.new( 0 )
    items.each do |item|
      if item[:tags]
        item[:tags].each do |tag|
          count[ tag ] += 1
        end
      end
    end
    count
  end

  
  #Sort the tags of an item collection (defaults
  #to all site items) in 'n' classes of rank.
  #The rank 0 corresponds to the most frequent
  #tags. The rank 'n-1' to the least frequents.
  #The result is a hash such as: { tag => rank }
  def rank_tags(n, items=nil) 

    items = @items if items.nil?
    count = count_tags( items )

    max, min = 0, items.size
    count.keys.each do |t|
      max = count[t] if count[t] > max
      min = count[t] if count[t] < min
    end    
    divisor = ( ( max.to_f - min )  / n )    

    ranks = {}
    count.keys.each do |t|
      rank = n - 1 -  ( count[t] - min ) / divisor
      rank = 0 if rank < 0
      ranks[t] = rank.to_i
    end

    ranks
  end
end

include TaggingExtra
