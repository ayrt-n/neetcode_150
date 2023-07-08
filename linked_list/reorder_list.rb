# frozen_string_literal: true


# Definition for singly-linked list
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# SOLUTION WITH CONSTANT SPACE COMPLEXITY
# Time complexity: O(n)
# Space complexity: O(1)
def reorder_list(head)
  first = head
  second = find_second_half(head)
  second = reverse_linked_list(second)
  
  until second.nil?
    tmp = second.next
    second.next = first.next
    first.next = second
    second = tmp
    first = first.next.next
  end

  first.next = nil unless first.nil?
end

# Takes head of linked list, returns the node of the start of second half
def find_second_half(head)
  slow = head
  fast = head.next

  # Traverse list until fast finds the end
  until fast.nil? || fast.next.nil?
    slow = slow.next
    fast = fast.next.next
  end

  # Once end found, slow.next will be the start of the second half
  slow.next
end

def reverse_linked_list(node)
  curr = nil
  next_node = node

  until next_node.nil?
    tmp = next_node.next
    next_node.next = curr
    curr = next_node
    next_node = tmp
  end

  curr
end

# SOLUTION WITH LINEAR SPACE COMPLEXITY
# Time complexity: O(n)
# Space complexity: O(n)
# def reorder_list(head)
#   nodes = linked_list_nodes(head)
#   len = nodes.length
#   curr = nil

#   0.upto((len - 1) / 2) do |i|
#     curr.next = nodes[i] if curr
#     nodes[i].next = nodes[len - 1 - i]
#     curr = nodes[len - 1 - i]
#   end

#   curr.next = nil
# end

# # Takes head of linked list, returns array of each node in order
# def linked_list_nodes(head)
#   res = []
#   curr = head

#   while curr
#     res << curr
#     curr = curr.next
#   end

#   res
# end
