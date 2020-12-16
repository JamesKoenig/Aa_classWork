def bad_two_sum?(arr, target)                 # O(n^2)
    (0...arr.length).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target
        end
    end
    false
end

def okay_two_sum?(arr,target)                 # O(nlog(n))
    sorted = arr.sort
    (0...arr.length).each do |idx1|           # O(n)
        idx2 = bsearch(arr, target-arr[idx1]) # O(log(n))
        return true if !idx2.nil?
    end
    return false
end

def bsearch(arr,val, offset_start=0, offset_end=arr.length) # O(log(n))
    return nil if arr == [] || offset_start == offset_end
    halfway = (offset_end + offset_start)/2
    case arr[halfway] <=> val
    when  1 #arr[halfway] is greater than
        return bsearch(arr, val, offset_start, halfway)
    when  0
        return halfway
    when -1 #arr[halfway] is less than
        return bsearch(arr, val, halfway+1, offset_end)
    end
end

def two_sum(arr,target) # O(n)
    needed = Hash.new()
    arr.each_with_index do |val,idx|
        if needed.has_key?(val)
            return [needed[val],idx]
        else
            needed[target-val] = idx
        end
    end
    return []
end

def two_sum?(arr,target) # O(n) because two_sum is O(n)
    return two_sum(arr,target) != []
end
