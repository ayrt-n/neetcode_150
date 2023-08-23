# frozen_string_literal: true

# Time complexity:
# Space complexity:
def is_interleave(s1, s2, s3)
  dfs(s1, s2, s3)
end

def dfs(s1, s2, s3, p1 = 0, p2 = 0, p3 = 0)
  return p1 == s1.length && p2 == s2.length if p3 == s3.length
  return true if s1[p1] == s3[p3] && dfs(s1, s2, s3, p1 + 1, p2, p3 + 1)
  return true if s2[p2] == s3[p3] && dfs(s1, s2, s3, p1, p2 + 1, p3 + 1)

  false
end
