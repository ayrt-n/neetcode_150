# frozen_string_literal: true

# Definition for binary tree node
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# Time complexity: O(n)
# Space complexity: O(n)
def is_valid_bst(root, max = Float::INFINITY, min = -Float::INFINITY)
  return true if root.nil?
  return false if root.val >= max || root.val <= min

  left_valid = is_valid_bst(root.left, root.val, min)
  right_valid = is_valid_bst(root.right, max, root.val)

  left_valid && right_valid
end
