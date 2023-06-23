# frozne_string_literal: true

# Definition for a binary tree node
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# Brute Force Solution
# Time complexity: Unsure but feel like O(p * q) where p is # of root nodes and q is # of sub root nodes
# Space complexity: Unsure but feel like O(p * q) where p is # of root nodes and q is # of sub root nodes
def subtree?(root, sub_root)
  return true if root.nil? && sub_root.nil?

  stack = [root]

  until stack.empty?
    curr = stack.pop
    result = same_tree?(curr, sub_root) if curr.val == sub_root.val
    return true if result

    stack << curr.left if curr.left
    stack << curr.right if curr.right
  end

  false
end

def same_tree?(p, q)
  return p == q if p.nil? || q.nil?
  return false if p.val != q.val

  same_tree?(p.left, q.left) && same_tree?(p.right, q.right)
end
