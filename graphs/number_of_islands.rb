# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def num_islands(grid)
  islands = 0
  visited = Set.new
  rows = grid.length
  cols = grid[0].length

  (0...rows).each do |r|
    (0...cols).each do |c|
      next if grid[r][c] == '0' || visited.include?([r, c])

      islands += 1
      queue = [[r, c]]
      until queue.empty?
        cr, cc = queue.shift
        next if visited.include?([cr, cc])

        visited << [cr, cc]

        [[cr + 1, cc], [cr - 1, cc], [cr, cc + 1], [cr, cc - 1]].each do |coord|
          queue << [coord[0], coord[1]] if in_bounds?(rows, cols, coord[0], coord[1]) && grid[coord[0]][coord[1]] == '1'
        end
      end
    end
  end

  islands
end

# Checks if given row and col are in bounds and returns bool
def in_bounds?(max_row, max_col, row, col)
  row < max_row && col < max_col && row >= 0 && col >= 0
end
