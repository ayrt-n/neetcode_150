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
# Space complexity: O(k)
def kth_smallest(root, k, arr = [])
  kth_smallest(root.left, k, arr) if root.left

  arr.push(root.val) if arr.length < k
  return arr[-1] if arr.length == k

  kth_smallest(root.right, k, arr) if root.right
end
