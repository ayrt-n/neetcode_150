# frozen_string_literal: true

# Time complexity:
# Space complexity:
def oranges_rotting(grid)
  rows, cols = [grid.length, grid[0].length]
  rotten = []

  # Find all rotten and fresh oranges
  (0...rows).each do |r|
    (0...cols).each do |c|
      rotten << [r, c] if grid[r][c] == 2
    end
  end

  # Rot oranges starting at rotten oranges, return minutes required to rot all adjacent
  minutes = [bfs(grid, rotten), 0].max

  # If any fresh oranges remain, return -1
  (0...rows).each do |r|
    (0...cols).each do |c|
      return -1 if grid[r][c] == 1
    end
  end

  minutes
end

def bfs(grid, queue = [])
  minutes = -1

  until queue.empty?
    minutes += 1
    queue.length.times do
      cr, cc = queue.shift

      [[cr + 1, cc], [cr - 1, cc], [cr, cc + 1],[cr, cc - 1]].each do |coord|
        next unless coord[0] >= 0 && coord[0] < grid.length &&
                    coord[1] >= 0 && coord[1] < grid[0].length &&
                    grid[coord[0]][coord[1]] == 1

        grid[coord[0]][coord[1]] = 2
        queue << coord
      end
    end
  end

  minutes
end
