# frozen_string_literal: true

# DFS + Memoization Solution
# Time complexity: O(m * n)
# Space complexity: O(m * n)
def is_interleave(s1, s2, s3)
  dfs(s1, s2, s3)
end

def dfs(s1, s2, s3, p1 = 0, p2 = 0, p3 = 0, cache = {})
  return if p1 == s1.length && p2 == s2.length if p3 == s3.length
  return cache[[p1, p2]] if cache[[p1, p2]]
  
  if p1 < s1.length && s1[p1] == s3[p3] && dfs(s1, s2, s3, p1 + 1, p2, p3 + 1)
    return true
  end

  if p2 < s2.length && s2[p2] == s3[p3] && dfs(s1, s2, s3, p1, p2 + 1, p3 + 1)
    return true
  end

  cache[[p1, p2]] = false
end

# Dynamic Programming Solution
# Time complexity: O(m * n)
# Space complexity: O(m * n)
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  dp = Array.new(s1.length + 1) { Array.new(s2.length + 1) { false } }
  dp[-1][-1] = true
  
  (dp.length - 1).downto(0) do |p1|
    (dp[p1].length - 1).downto(0) do |p2|
      next if dp[p1][p2]

      dp[p1][p2] = dp[p1 + 1][p2] if s1[p1] == s3[p1 + p2]
      dp[p1][p2] ||= dp[p1][p2 + 1] if s2[p2] == s3[p1 + p2]
    end
  end
  
  dp[0][0]
end
