# frozen_string_literal: true

# Time complexity: O(n * w * logw) where n is the number of words and w is the average characters per word
# Space complexity: O(n)
def group_anagrams(strs)
  results = Hash.new { |h, k| h[k] = [] }

  strs.each do |str|
    key = anagram_key(str)
    results[key] << str
  end

  results.values
end

def anagram_key(str)
  str.chars.sort
end