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
def right_side_view(root)
  res = []
  return res if root.nil?

  queue = [root]
  until queue.empty?
    queue.length.times do |i|
      node = queue.shift
      res.push(node.val) if i.zero?
      queue.push(node.right) if node.right
      queue.push(node.left) if node.left
    end
  end

  res
end
