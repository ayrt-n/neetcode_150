# frozen_string_literal: true

# Definition for a binary tree node
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Time complexity: O(n)
# Space complexity: O(n)
def balanced?(root, height = { h: 0 })
  return true if root.nil?

  lh = { h: 0 }
  rh = { h: 0 }

  lbal = balanced?(root.left, lh)
  rbal = balanced?(root.right, rh)
  height[:h] = [lh[:h], rh[:h]].max + 1

  (lbal && rbal) && ((lh[:h] - rh[:h]).abs < 2)
end
