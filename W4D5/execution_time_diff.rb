
module Phase1
  def self.my_min(list)
    list.each do |ele1|
      return ele1 if list.all? { |ele2| ele1 <= ele2 }
    end
  end

  def self.largest_contiguous_subsum(list) # O(n^3)
    sub_arrs = subarrays(list)
    sub_sums = sub_arrs.map {|sub_arr| sub_arr.sum}
    sub_sums.max
  end

  private
  def self.subarrays(array)
    result = []
    (0...array.length).each do |idx1|
        (idx1+1...array.length).each do |idx2|
            result << array[idx1..idx2]
        end
    end
    result
  end
end

module Phase2
  def self.my_min(list)
    smallest = nil
    list.each do |ele1|
      if smallest == nil || ele1 < smallest
        smallest = ele1
      end
    end
    return smallest
  end

    def self.largest_contiguous_subsum(list)
    first                         = list[0]

    contiguous_subsum             = first
    largest_contiguous_subsum     = first

    (1...list.length).each do |idx|
      num = list[idx]
      if contiguous_subsum        < 0
        contiguous_subsum         = num
      else
        contiguous_subsum        += num
      end
      if contiguous_subsum        > largest_contiguous_subsum
        largest_contiguous_subsum = contiguous_subsum
      end
    end
    return largest_contiguous_subsum
  end
end

