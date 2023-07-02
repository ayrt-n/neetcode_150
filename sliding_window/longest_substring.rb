# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def length_of_longest_substring(s)
  longest, l, r = [0, 0, 0]
  chars = {}

  while r < s.length
    while chars[s[r]]
      chars[s[l]] = nil
      l += 1
    end

    chars[s[r]] = true
    longest = [longest, r - l + 1].max
    r += 1
  end

  count > longest ? count : longest
end
