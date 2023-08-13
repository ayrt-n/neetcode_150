# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: O(n)
def longest_palindrome(s)
  res = ''
  res_length = 0

  (0...s.length).each do |i|
    l, r = [i, i]
    while l >= 0 && r < s.length && s[l] == s[r]
      if r - l + 1 > res_length
        res = s[l..r]
        res_length = r - l + 1
      end

      l -= 1
      r += 1
    end

    l, r = [i, i + 1]
    while l >= 0 && r < s.length && s[l] == s[r]
      if r - l + 1 > res_length
        res = s[l..r]
        res_length = r - l + 1
      end

      l -= 1
      r += 1
    end
  end

  res
end
