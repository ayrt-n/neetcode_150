# frozne_string_literal: true

# Time complexity: O(n * dict)
# Space complexity: O(1)
def word_break(s, word_dict)
  recurse(s, word_dict)
end

def recurse(s, word_dict, memo = {})
  return true if word_dict.include?(s)
  return false if memo[s] == false

  word_dict.each do |w|
    next unless s[0...w.length] == w
    return true if recurse(s[w.length..], word_dict, memo)
  end

  memo[s] = false
end
