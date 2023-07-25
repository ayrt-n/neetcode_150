# frozen_string_literal: true

# ITERATIVE SOLUTION (BFS)
# Time complexity: O(m * n)
# Space complexity: O(m * n)
def max_area_of_island(grid)
  res = 0
  visited = Set.new
  rows, cols = [grid.length, grid[0].length]

  (0...rows).each do |r|
    (0...cols).each do |c|
      next if grid[r][c].zero? || visited.include?([r, c])

      count = 0
      queue = [[r, c]]
      until queue.empty?
        cr, cc = queue.shift
        next if visited.include?([cr, cc])

        count += 1
        visited << [cr, cc]
        [[cr + 1, cc], [cr - 1, cc], [cr, cc + 1], [cr, cc - 1]].each do |coord|
          queue << coord if coord[0] < rows && coord[0] >= 0 &&
                            coord[1] < cols && coord[1] >= 0 &&
                            grid[coord[0]][coord[1]] == 1
        end
      end

      res = [count, res].max
    end
  end

  res
end
