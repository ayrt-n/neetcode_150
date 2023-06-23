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

# Time complexity: O(n)
# Space complexity: O(n)
def same_tree?(p, q)
  p_queue = [p]
  q_queue = [q]

  until p_queue.empty? || q_queue.empty?
    p_node = p_queue.shift
    q_node = q_queue.shift
    return false if p_node&.val != q_node&.val

    p_queue.push(p_node.left, p_node.right) if p_node
    q_queue.push(q_node.left, q_node.right) if q_node
  end

  p_queue.length == q_queue.length
end

# Recursive solution
# Time complexity: O(n)
# Space complexity: O(n)
def recursive_same_tree?(p, q)
  return p == q if p.nil? || q.nil?

  lsame = recursive_same_tree?(p.left, q.left)
  rsame = recursive_same_tree?(p.right, q.right)

  lsame && rsame && (p.val == q.val)
end
