# frozen_string_literal: true

# Time complexity:
# Space complexity:
def inclusion?(s1, s2)
  h1 = character_counts(s1)
  h2 = Hash.new(0)
  l, r = [0, 0]

  while r < s2.length
    char = s2[r]
    h2[char] += 1

    while h2[char] > h1[char]
      h2[s2[l]] -= 1
      l += 1
    end

    return true if (r - l + 1) == s1.length

    r += 1
  end

  false
end

def character_counts(str)
  result = Hash.new(0)
  str.each_char { |c| result[c] += 1}
  result
end
