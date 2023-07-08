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
  halfway = return_list_middle(head)
  second = reverse_linked_list(halfway.next)
  halfway.next = nil

  until second.nil?
    tmp = second.next
    second.next = first.next
    first.next = second
    second = tmp
    first = first.next.next
  end
end

# Takes head of linked list, returns the middle node
def return_list_middle(head)
  slow = head
  fast = head.next

  until fast.nil? || fast.next.nil?
    slow = slow.next
    fast = fast.next.next
  end

  slow
end

def reverse_linked_list(node)
  prev = nil
  curr = node

  until curr.nil?
    tmp = curr.next
    curr.next = prev
    prev = curr
    curr = tmp
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
