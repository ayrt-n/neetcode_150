# frozen_string_literal: true

# Definition for singly-linked list
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Time complexity: O(n)
# Space complexity: O(1)
def reverse_list(head)
  prev_node = nil
  current_node = head

  while current_node
    next_node = current_node.next
    current_node.next = prev_node

    prev_node = current_node
    current_node = next_node
  end

  linked_list_to_array(prev_node)
end

def linked_list_to_array(head)
  result = []
  current_node = head

  while current_node
    result << current_node.val
    current_node = current_node.next
  end

  result
end
