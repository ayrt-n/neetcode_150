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

def diameter_of_binary_tree(root)
  return 0 if root.nil?

  left_height = height_of_tree(root.left)
  right_height = height_of_tree(root.right)

  diameter = left_height + right_height

  left_diameter = diameter_of_binary_tree(root.left)
  right_diameter = diameter_of_binary_tree(root.right)

  [left_diameter, right_diameter, diameter].max
end

def height_of_tree(root)
  return 0 if root.nil?

  left = height_of_tree(root.left)
  right = height_of_tree(root.right)

  [left, right].max + 1
end
