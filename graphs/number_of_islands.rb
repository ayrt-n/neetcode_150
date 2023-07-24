# frozen_string_literal: true

# RECURSIVE SOLUTION
# Time complexity: O(n)
# Space complexity: O(n)
def num_islands(grid)
  islands = 0

  (0...grid.length).each do |r|
    (0...grid[0].length).each do |c|
      next unless grid[r][c] == '1'

      islands += 1
      dfs(grid, r, c)
    end
  end

  islands
end

def dfs(grid, row, col)
  return if row >= grid.length || col >= grid[0].length ||
            row.negative? || col.negative? || grid[row][col] != '1'

  grid[row][col] = '#'
  dfs(grid, row + 1, col)
  dfs(grid, row - 1, col)
  dfs(grid, row, col + 1)
  dfs(grid, row, col - 1)
end

# ITERATIVE SOLUTION
# Time complexity: O(n)
# Space complexity: O(n)
# def num_islands(grid)
#   islands = 0
#   visited = Set.new
#   rows = grid.length
#   cols = grid[0].length

#   (0...rows).each do |r|
#     (0...cols).each do |c|
#       next if grid[r][c] == '0' || visited.include?([r, c])

#       islands += 1
#       queue = [[r, c]]
#       until queue.empty?
#         cr, cc = queue.shift
#         next if visited.include?([cr, cc])

#         visited << [cr, cc]

#         [[cr + 1, cc], [cr - 1, cc], [cr, cc + 1], [cr, cc - 1]].each do |coord|
#           queue << [coord[0], coord[1]] if in_bounds?(rows, cols, coord[0], coord[1]) && grid[coord[0]][coord[1]] == '1'
#         end
#       end
#     end
#   end

#   islands
# end

# # Checks if given row and col are in bounds and returns bool
# def in_bounds?(max_row, max_col, row, col)
#   row < max_row && col < max_col && row >= 0 && col >= 0
# end
