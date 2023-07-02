# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def length_of_longest_substring(s)
  longest, count, l, r = [0, 0, 0, 0]
  chars = {}

  while r < s.length
    if chars[s[r]]
      longest = count if count > longest
      loop do
        chars[s[l]] = nil
        count -= 1
        l += 1
        break if s[l - 1] == s[r]
      end
    end

    chars[s[r]] = true
    count += 1
    r += 1
  end

  count > longest ? count : longest
end
