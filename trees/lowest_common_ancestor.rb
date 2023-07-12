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
# Time complexity: O(logn)
# Space complexity: O(1)
def lowest_common_ancestor(root, p, q)
  curr = root

  while curr
    if p.val < root.val && q.val < root.val
      curr = curr.left
    elsif p.val > root.val && q.val > root.val
      curr = curr.right
    else
      return curr
    end
  end

  nil
end

# RECURSIVE SOLUTION
# Time complexity: O(logn)
# Space complexity: O(1)
def lowest_common_ancestor(root, p, q)
  return root if (p.val <= root.val && q.val >= root.val) || (p.val >= root.val && q.val <= root.val)

  if p.val < root.val && q.val < root.val
    lowest_common_ancestor(root.left, p, q)
  else
    lowest_common_ancestor(root.right, p, q)
  end
end