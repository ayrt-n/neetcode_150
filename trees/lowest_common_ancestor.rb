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

# Time complexity: O(n * d)
# Space complexity: O(n)
def lowest_common_ancestor(root, p, q)
  lca = nil
  queue = [root]

  until queue.empty?
    curr = queue.shift
    next if curr.nil?

    lca = curr if descendants?(curr, p, q)
    queue.push(curr.left, curr.right)
  end

  lca
end

def descendants?(root, p, q)
  queue = [root]
  found = []

  until queue.empty? || found.length == 2
    curr = queue.shift
    next if curr.nil?

    found << curr if curr.val == p.val || curr.val == q.val
    queue.push(curr.left, curr.right)
  end

  found.length == 2
end
