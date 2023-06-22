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

# Recursive Solution
# Time complexity: O(n)
# Space complexity: O(n)
def max_depth(root)
  return 0 if root.nil?

  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  [left_depth, right_depth].max + 1
end

# Iterative Solution
# Time complexity: O(n)
# Space complexity: 
def max_depth_loop(root)
  result = 0
  return result if root.nil?

  stack = [{ node: root, prev_h: result }]

  until stack.empty?
    curr = stack.pop
    height = curr[:prev_h] + 1
    result = height if height > result
    stack.push({ node: curr[:node].left, prev_h: height }) if curr[:node].left
    stack.push({ node: curr[:node].right, prev_h: height }) if curr[:node].right
  end

  result
end
