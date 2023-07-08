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
  dummy = ListNode.new(0, head)
  curr = dummy
  lead = head
  n.times { lead = lead.next }

  until lead.nil?
    curr = curr.next
    lead = lead.next
  end

  curr.next = curr.next.next
  dummy.next
end
