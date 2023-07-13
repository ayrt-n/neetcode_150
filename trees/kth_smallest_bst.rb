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

# ITERATIVE SOLUTION
# Time complexity: O(n)
# Space complexity: O(n)
def kth_smallest(root, k)
  n = 0
  stack = []
  curr = root

  until curr.nil? && stack.empty?
    while curr
      stack.push(curr)
      curr = curr.left
    end

    curr = stack.pop
    n += 1
    return curr.val if n == k

    curr = curr.right
  end
end

# RECURSIVE SOLUTION
# Time complexity: O(n)
# Space complexity: O(k)
# def kth_smallest(root, k, arr = [])
#   kth_smallest(root.left, k, arr) if root.left

#   arr.push(root.val) if arr.length < k
#   return arr[-1] if arr.length == k

#   kth_smallest(root.right, k, arr) if root.right
# end
