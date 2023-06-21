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

def invert_tree(root)
  return nil unless root

  left = root.left
  right = root.right
  root.right = invert_tree(left)
  root.left = invert_tree(right)

  root
end
