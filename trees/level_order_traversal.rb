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
def level_order(root)
  res = []
  queue = [root]

  until queue.empty?
    level = []
    queue.length.times do
      node = queue.shift
      next if node.nil?

      level.push(node.val)
      queue.push(node.left, node.right)
    end
    res.push(level) unless level.empty?
  end

  res
end
