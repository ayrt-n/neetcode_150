# frozne_string_literal: true

# Time complexity: Real bad
# Space complexity: O(1)
def word_break(s, word_dict)
  return true if word_dict.include?(s)

  (0...s.length).each do |i|
    next unless word_dict.include?(s[0..i])
    return true if word_break(s[i + 1..], word_dict)
  end

  false
end
