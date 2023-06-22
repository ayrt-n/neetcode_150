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

def diameter_of_binary_tree(root, height = { h: 0 })
  l_height = { h: 0 }
  r_height = { h: 0 }

  if root.nil?
    height[:h] = 0
    return 0
  end

  l_diameter = diameter_of_binary_tree(root.left, l_height)
  r_diameter = diameter_of_binary_tree(root.right, r_height)
  height[:h] = [l_height[:h], r_height[:h]].max + 1

  [l_height[:h] + r_height[:h], [l_diameter, r_diameter].max].max
end
