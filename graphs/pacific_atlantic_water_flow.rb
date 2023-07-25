# frozen_string_literal: true

# Slow DFS solution
def pacific_atlantic(heights)
  res = []

  (0...heights.length).each do |r|
    (0...heights[0].length).each do |c|
      res << [r, c] if dfs(heights, r, c)
    end
  end

  res
end

def dfs(heights, row, col, visited = Set.new, oceans = {})
  return true if oceans[:pacific] && oceans[:atlantic]

  visited << [row, col]

  [[row - 1, col], [row, col - 1], [row + 1, col], [row, col + 1]].each do |coord|
    next if visited.include?(coord)

    if coord[0].negative? || coord[1].negative?
      oceans[:pacific] = true
      next
    end

    if coord[0] >= heights.length || coord[1] >= heights[0].length
      oceans[:atlantic] = true
      next
    end

    if heights[coord[0]][coord[1]] <= heights[row][col]
      return true if dfs(heights, coord[0], coord[1], visited, oceans)
    end
  end

  oceans[:atlantic] && oceans[:pacific]
end

# Slow BFS solution
def pacific_atlantic(heights)
  res = []

  (0...heights.length).each do |r|
    (0...heights[0].length).each do |c|
      res << [r, c] if flows_to_oceans?(heights, r, c)
    end
  end

  res
end

def flows_to_oceans?(heights, r, c)
  visited = Set.new
  rows, cols = [heights.length, heights[0].length]
  pacific_atlantic = [false, false]

  queue = [[r, c]]
  until queue.empty?
    cr, cc = queue.shift
    return true if pacific_atlantic.all?
    next if visited.include?([cr, cc])

    visited << [cr, cc]

    [[cr + 1, cc], [cr - 1, cc], [cr, cc + 1], [cr, cc - 1]].each do |coord|
      if coord[0].negative? || coord[1].negative?
        pacific_atlantic[0] = true
      elsif coord[0] >= rows || coord[1] >= cols
        pacific_atlantic[1] = true
      elsif heights[coord[0]][coord[1]] <= heights[cr][cc]
        queue << [coord[0], coord[1]]
      end
    end
  end

  pacific_atlantic.all?
end