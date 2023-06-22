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

# Depth-First Iterative Solution
# Time complexity: O(n)
# Space complexity: O(n)
def max_depth_dfs(root)
  result = 0
  return result if root.nil?

  stack = [[root, 1]]

  until stack.empty?
    node, depth = stack.pop
    result = depth if depth > result
    stack.push([node.left, depth]) if node.left
    stack.push([node.right, depth]) if node.right
  end

  result
end

# Breadth-First Iterative Solution
# Time complexity: O(n)
# Space complexity: O(n)
def max_depth_bfs(root)
  return 0 if root.nil?

  level = 0
  queue = [root]

  until queue.empty?
    queue.length.times do
      node = queue.shift
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end

    level += 1
  end

  level
end
