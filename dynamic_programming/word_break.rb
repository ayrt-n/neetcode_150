# frozne_string_literal: true

# Time complexity: Still bad
# Space complexity: O(1)
def word_break(s, word_dict)
  recurse(s, word_dict)
end

def recurse(s, word_dict, memo = {})
  return true if word_dict.include?(s)
  return false if memo[s] == false

  (0...s.length).each do |i|
    next unless word_dict.include?(s[0..i])
    return true if recurse(s[i + 1..], word_dict, memo)
  end

  memo[s] = false
end
