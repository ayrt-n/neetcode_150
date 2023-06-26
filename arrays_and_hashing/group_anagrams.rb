# frozen_string_literal: true

# Time complexity: O(n * w) where n is the number of words and w is the average characters per word
# Space complexity: O(n)
def group_anagrams(strs)
  results = Hash.new { |h, k| h[k] = [] }

  strs.each do |str|
    key = str_to_char_count_array(str)
    results[key] << str
  end

  results.values
end

def str_to_char_count_array(str)
  chars = Array.new(26) { 0 }
  str.each_char { |c| chars[normalize_ascii(c)] += 1 }
  chars
end

def normalize_ascii(char)
  char.ord - 97
end
