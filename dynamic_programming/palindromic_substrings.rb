# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: O(1)
def count_substrings(s)
  res = 0

  (0...s.length).each do |i|
    l, r = [i, i]
    while l >= 0 && r < s.length && s[l] == s[r]
      res += 1
      l -= 1
      r += 1
    end

    l, r = [i, i + 1]
    while l >= 0 && r < s.length && s[l] == s[r]
      res += 1
      l -= 1
      r += 1
    end
  end

  res
end
