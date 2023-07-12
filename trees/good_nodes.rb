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
def good_nodes(root, max = root.val)
  return 0 if root.nil?
  current_max = root.val > max ? root.val : max

  left_good_nodes = good_nodes(root.left, current_max)
  right_good_nodes = good_nodes(root.right, current_max)
  
  good_nodes = left_good_nodes + right_good_nodes
  good_nodes += 1 if current_max == root.val

  good_nodes
end
