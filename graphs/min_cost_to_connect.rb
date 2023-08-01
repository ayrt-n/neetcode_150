# frozen_string_literal: true

require 'set'
require 'rubygems'
require 'algorithms'

# Time complexity: O(n^2 * logn)
def min_cost_connect_points(points)
  res = 0
  visited = Set.new
  mh = Containers::MinHeap.new([[0, points[0]]])

  until visited.size == points.length
    cost, point = mh.pop
    next if visited.include?(point)

    visited << point
    res += cost

    points.each do |pt|
      next if visited.include?(pt)

      mh.push([cost(point, pt), pt])
    end
  end

  res
end

def cost(pt1, pt2)
  (pt1[0] - pt2[0]).abs + (pt1[1] - pt2[1]).abs
end
