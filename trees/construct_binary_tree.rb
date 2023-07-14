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

# Time complexity: O(n^2)
# Space complexity: O(n)
def build_tree(preorder, inorder)
  return nil if preorder.empty? && inorder.empty?

  root = TreeNode.new(preorder[0])
  pivot = inorder.find_index(preorder[0])

  root.left = build_tree(preorder[1..pivot], inorder[0...pivot])
  root.right = build_tree(preorder[pivot + 1..], inorder[pivot + 1..])
  
  root
end
