class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @prev_num_buckets = nil
    @current_items = []
  end

  def insert(key)
    unless include?(key)
      self[key.hash] << key
      @current_items << key
      @count += 1
    end 
    if @count > num_buckets
      resize!
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    return @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @prev_num_buckets = num_buckets
    @store = Array.new(num_buckets*2) {Array.new}
    @count = 0
    @current_items.each do |item| 
      insert(item)
    end
    @current_items.uniq!
  end
  
end
