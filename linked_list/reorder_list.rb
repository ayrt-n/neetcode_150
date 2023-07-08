# frozen_string_literal: true


# Definition for singly-linked list
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Time complexity: 
# Space complexity:
def reorder_list(head)
  nodes = linked_list_nodes(head)
  len = nodes.length
  curr = nil

  0.upto((len - 1) / 2) do |i|
    curr.next = nodes[i] if curr
    nodes[i].next = nodes[len - 1 - i]
    curr = nodes[len - 1 - i]
  end

  curr.next = nil
end

# Takes head of linked list, returns array of each node in order
def linked_list_nodes(head)
  res = []
  curr = head

  while curr
    res << curr
    curr = curr.next
  end

  res
end
