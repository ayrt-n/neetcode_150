# frozen_string_literal: true

# Time complexity: O(2^n)
# Space complexity: O(n^2)
def partition(s)
  backtrack(s, 0)
end

def backtrack(s, i, res = [], parts = [])
  res.push(parts.dup) && return if i >= s.length

  (i...s.length).each do |j|
    next unless palindrome?(s[i..j])

    parts.push(s[i..j])
    backtrack(s, j + 1, res, parts)
    parts.pop
  end

  res
end

def palindrome?(s)
  l = 0
  r = s.length - 1

  while l < r
    return false if s[l] != s[r]

    l += 1
    r -= 1
  end

  true
end
