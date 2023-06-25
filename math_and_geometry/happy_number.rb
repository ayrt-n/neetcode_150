# frozen_string_literal: true

# Time complexity: O(n) (Unsure)
# Space complexity: O(n)
def happy?(n)
  tmp = n
  visited = {}

  loop do
    str = tmp.to_s
    return false if visited[str]

    visited[str] = true
    tmp = str.chars.reduce(0) { |sum, c| sum + c.to_i**2 }
    return true if tmp == 1
  end
end
