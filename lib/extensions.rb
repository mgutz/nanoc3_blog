class Nanoc3::Item 
  # Will be in future version of nanoc. Delete if needed.
  def compiled_content(opts = {}) 
    opts[:rep] ||= :default 
    opts[:snapshot] ||= :last 
    reps.find { |r| r.name == opts[:rep] }.content_at_snapshot(opts[:snapshot]) 
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