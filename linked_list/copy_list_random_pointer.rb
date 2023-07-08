# frozen_string_literal: true

# Definition for node
class Node
  attr_accessor :val, :next, :random

  def initialize(val = 0)
    @val = val
    @next = nil
    @random = nil
  end
end

# Time complexity: O(n)
# Space complexity: O(n)
def copyRandomList(head)
  res = Node.new(0)
  node_list = {}

  old = head
  curr = res
  until old.nil?
    if node_list[old]
      curr.next = node_list[old]
    else
      curr.next = Node.new(old.val)
      node_list[old] = curr.next
    end

    curr = curr.next

    if old.random
      if node_list[old.random]
        curr.random = node_list[old.random]
      else
        curr.random = Node.new(old.random.val)
        node_list[old.random] = curr.random
      end
    end

    old = old.next
  end

  res.next
end
