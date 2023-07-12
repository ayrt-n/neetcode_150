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

# Time complexity: O(logn)
# Space complexity: O(logn)
def lowest_common_ancestor(root, p, q)
  return root if (p.val <= root.val && q.val >= root.val) || (p.val >= root.val && q.val <= root.val)

  if p.val < root.val && q.val < root.val
    lowest_common_ancestor(root.left, p, q)
  else
    lowest_common_ancestor(root.right, p, q)
  end
end
