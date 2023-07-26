# frozen_string_literal: true

require 'set'

# Time complexity: O(m*n)
# Space complexity: O(m*n)
def pacific_atlantic(heights)
  rows, cols = [heights.length, heights[0].length]
  access_pacific = Set.new
  access_atlantic = Set.new

  (0...rows).each do |r|
    dfs(heights, r, 0, access_pacific)
    dfs(heights, r, cols - 1, access_atlantic)
  end

  (0...cols).each do |c|
    dfs(heights, 0, c, access_pacific)
    dfs(heights, rows - 1, c, access_atlantic)
  end

  access_pacific.to_a.intersection(access_atlantic.to_a)
end

def dfs(heights, row, col, access)
  return if access.include?([row, col])

  access << [row, col]

  [[row + 1, col], [row - 1, col], [row, col + 1], [row, col - 1]].each do |coord|
    if coord[0] < heights.length && coord[0] >= 0 && coord[1] < heights[0].length && coord[1] >= 0 && heights[coord[0]][coord[1]] >= heights[row][col]
      dfs(heights, coord[0], coord[1], access)
    end
  end
end
