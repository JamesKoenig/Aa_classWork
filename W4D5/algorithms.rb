# O(n^2) polynomial time
# O(1) space

def my_min1(arr)
  min = arr[0]
  i = 0
  while i < arr.length - 1 # n
    j = i + 1
    num1 = arr[i]
    is_min = true
    while j < arr.length    # n
      num2 = arr[j]

      if num1 < num2 && num1 < min
        is_min = false
        min = num1
      end

      j += 1
    end

    i += 1
  end

  return min if is_min == true
end

# O(n) linear time 
# o(1) space
def my_min2(arr)
    min = arr[0]
    arr.each { |num| min = num if num < min }
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min1(list)  # =>  -5

# --------------------------------------------- #
# --------------------------------------------- #

#  O(n^3) Polynomial
#  O(n^3) cubic space
def largest_contiguous_subsum1(array)
    subset = []
    array.each_index do |i| # make subets, store into 'subset' array
        (i...array.length).each do |j| # o(n^2)
            subset << array[i..j]  # o(n^3) cause slicing
        end
    end

    subset_sum = []
    subset.each do |ele|
        subset_sum << ele.sum
    end
    subset_sum.max
end

# O(n) linear time 
# O(1) constant space
def largest_contiguous_subsum2(array)
    largest = array[0]
    current_sum = array[0]

    (1...array.length).each do |i|
        current_sum = 0 if current_sum < 0
        num = array[i]
        current_sum += num
        if current_sum > largest
          largest = current_sum
        end
    end

    largest
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])
