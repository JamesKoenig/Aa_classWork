class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
      return true
    else
      raise 'Out of bounds'
      return false
    end
    
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true if is_valid?(num)
  end

  private

  def is_valid?(num)
    num > 0 && num < @store.length
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
  end

  def remove(num)
    return false unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count + 1 >= num_buckets
    @count += 1 if super(num)
    false
  end

  def remove(num)
    @count -= 1 if super(num) != false
    false
  end

  private

  def resize!
    old_store_flat = @store.flatten
    @store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    old_store_flat.each {|old_num| insert(old_num)}
  end
end
