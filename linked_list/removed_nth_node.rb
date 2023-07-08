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
def remove_nth_from_end(head, n)
  prev = nil
  lag = head
  next_node = head.next
  lead = head
  n.times { lead = lead.next }

  until lead.nil?
    prev = lag
    lag = next_node
    next_node = lag.next
    lead = lead.next
  end

  if prev.nil?
    next_node
  else
    prev.next = next_node
    head
  end
end
