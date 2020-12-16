def first_anagram?(string1, string2)
    anagrams = all_anagrams(string1)
    anagrams.include?(string2)
end

# all of this work... all of this pain... and
# string.chars.permutation.to_a.map { |subarr| subarr.join('') }
# could just do for us 😭😭. I am despondent.
def all_anagrams(string)
    return [string] if string == ''
    previous_anagrams = all_anagrams(string[1..-1])

    result = []
    #go through each of the previous anagrams
    previous_anagrams.each do |anagram|
        #push copies of each anagram with our letter inserted at each possible position
        (0..anagram.length).each do |slice_idx|        #represent slicing point
            result << anagram[0...slice_idx] + string[0] + anagram[slice_idx..-1]
        end
    end
    result
end

def second_anagram?(string1,string2)
  string1.chars.each do |char|
    idx = string2.chars.find_index(char)
    return false if idx.nil?
    string2.slice!(idx)
  end
  string2 == ""
end

def third_anagram?(string1,string2)
    arr1 = string1.chars.sort
    arr2 = string2.chars.sort

    arr1 == arr2
end

def fourth_anagram?(string1, string2)
    char_hash = make_char_hash(string1)
    string2.each_char do |char|
        char_hash[char] -= 1
    end
    char_hash.values.all? {|value| value == 0}
end

def make_char_hash(string)
    char_hash = Hash.new(0)
    string.each_char do |char|
        char_hash[char] += 1
    end
    char_hash
end

