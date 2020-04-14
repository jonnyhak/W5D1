# require "enumerable"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    # self.first
  end

  def last
    # self.last
  end

  def empty?
    self.all? {|node| node.nil?}
  end

  def get(key)
    
  end

  def include?(key)
    self.key == nil ? false : true
  end

  def append(key, val)  #prev -> n -> tail
    if (key != nil && val != nil)
      n = Node.new(key, val)
      
      prev = @tail.prev
      prev.next = n
      n.prev = prev
      n.next = @tail
      @tail.prev = n
    end
  end

  def update(key, val)

  end

  def remove(key)
  end

  def each
    answer = []
    node = @head
    until node == nil
      answer << node
      node = node.next
    end
    answer
  end
    # i = 0 
    # while i < self.count
    #   self[i]
    #   i +=1
    # end
    # self
  

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
