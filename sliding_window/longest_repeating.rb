# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def character_replacement(s, k)
  chars = Hash.new(0)
  l, r = [0, 0]
  result = 0

  while r < s.length
    chars[s[r]] += 1

    while replacements(r, l, chars) > k
      chars[s[l]] -= 1
      l += 1
    end

    result = [result, r - l + 1].max
    r += 1
  end

  result
end

def replacements(r, l, char_hash)
  r - l + 1 - char_hash.max_by { |k, v| v }[1]
end
