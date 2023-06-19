# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def orig_palindrome?(s)
  normalized = normalize_palindrome(s)

  length = normalized.length
  middle = (length - 1) / 2

  (0..middle).each do |i|
    return false if normalized[i] != normalized[length - 1 - i]
  end

  true
end

def normalize_palindrome(str)
  str.gsub(/[^0-9a-zA-Z]/, '').downcase
end

# Alternative solution with constant space complexity
# Time complexity: O(n)
# Space complexity: O(1)
def palindrome?(s)
  left = 0
  right = s.length - 1

  while left < right
    if !alphanumeric?(s[left])
      left += 1
    elsif !alphanumeric?(s[right])
      right -= 1
    else
      return false if s[left].downcase != s[right].downcase

      left += 1
      right -= 1
    end
  end

  true
end

def alphanumeric?(char)
  ascii_code = char.ord
  (48..57).include?(ascii_code) || (65..90).include?(ascii_code) || (97..122).include?(ascii_code)
end
