class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  attr_accessor :store

  def insert(num)
    if num < 0 || num > @store.length
      raise "Out of bounds" 
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store

  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
   
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    # @store[num] = []
    @store[num].delete(num)
  end

  def include?(num)
    @store.include?([num])
  end

  private

  def [](num)
   
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :current_items, :prev_num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @current_items = []
    @prev_num_buckets = nil
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @current_items << num
      @count += 1 
      if @count > num_buckets
        resize!
      end
    end
    
  end

  def remove(num)
    if include?(num)
      @store[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
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
