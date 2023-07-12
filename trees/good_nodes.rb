# frozne_string_literal: true

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
def good_nodes(root)
  return 0 if root.nil?

  good_nodes_dfs(root, root.val)
end

def good_nodes_dfs(node, max)
  return 0 if node.nil?

  current_max = node.val > max ? node.val : max
  good_nodes = good_nodes_dfs(node.left, current_max) + good_nodes_dfs(node.right, current_max)
  good_nodes += 1 if current_max == node.val

  good_nodes
end
