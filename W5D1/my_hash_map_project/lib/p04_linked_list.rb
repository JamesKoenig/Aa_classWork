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
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return find(key).val if include?(key)
    nil
  end

  def include?(key)
    find(key) != nil
  end

  def append(key, val)
    new_node        = Node.new(key,val)
    new_node.prev   = @tail.prev
    new_node.next   = @tail
    @tail.prev.next = new_node  
    @tail.prev      = new_node
  end

  def update(key, val)
    find(key).val = val if include?(key)
  end

  def remove(key)
    find(key).remove if include?(key)
  end

  def each(&block)
    current = @head.next
    while current != @tail
      block.call(current)
      current = current.next  
    end
    self
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
  
  private

  def find(key)
    each { |link| return link if key == link.key }
    nil
  end
end
