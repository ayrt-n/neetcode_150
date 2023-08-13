# frozen_string_literal: true

# Time complexity: O(m * n)
# Space complexity: O(m * n)
def unique_paths(m, n)
  grid = Array.new(m) { Array.new(n) }
  grid[m - 1][n - 1] = 1

  dfs(grid, m, n)
end

def dfs(grid, m, n, row = 0, col = 0)
  return 0 if row >= m || col >= n
  return grid[row][col] if grid[row][col]

  paths = 0
  paths += dfs(grid, m, n, row, col + 1)
  paths += dfs(grid, m, n, row + 1, col)
end
