# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def num_islands(grid)
  islands = 0
  visited = Set.new

  (0...grid.length).each do |r|
    (0...grid[0].length).each do |c|
      next if visited.include?([r, c])

      visited << [r, c]
      if grid[r][c] == '1'
        islands += 1
        queue = [[r, c]]

        until queue.empty?
          r2, c2  = queue.shift
          visited << [r2, c2]
          next unless grid[r2][c2] == '1'

          [[r2 + 1, c2], [r2 - 1, c2], [r2, c2 + 1], [r2, c2 - 1]].each do |coord|
            queue << coord if in_bounds?(grid, coord[0], coord[1]) && !visited.include?(coord)
          end
        end
      end
    end
  end

  islands
end

# Checks if given row and column are within boundaries of board
# Returns bool
def in_bounds?(grid, row, col)
  row < grid.length && col < grid[0].length && row >= 0 && col >= 0
end
