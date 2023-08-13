# frozen_string_literal: true

# Time complexity: O(m * n)
# Space complexity: O(m * n)
def unique_paths(m, n)
  grid = Array.new(m) { Array.new(n) }
  last_row, last_col = [m - 1, n - 1]

  (grid.length - 1).downto(0) do |r|
    (grid[0].length - 1).downto(0) do |c|
      if r == last_row || c == last_col
        grid[r][c] = 1
      else
        grid[r][c] = 0
        grid[r][c] += grid[r + 1][c] || 0
        grid[r][c] += grid[r][c + 1] || 0
      end
    end
  end

  grid[0][0]
end
