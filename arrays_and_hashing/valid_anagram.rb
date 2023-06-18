# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def anagram?(s, t)
  return false if s.length != t.length

  s_letter_count = count_letters(s)
  t_letter_count = count_letters(t)

  s_letter_count.each do |char, count|
    return false if t_letter_count[char] != count
  end

  true
end

def count_letters(str)
  result = Hash.new(0)
  str.each_char { |c| result[c] += 1 }
  result
end
