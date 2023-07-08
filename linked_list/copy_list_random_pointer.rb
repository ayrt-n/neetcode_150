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
  old_to_new = { nil: nil }

  curr = head
  while curr
    old_to_new[curr] = Node.new(curr.val)
    curr.next
  end

  curr = head
  while curr
    copy = old_to_new[curr]
    copy.next = old_to_new[curr.next]
    copy.random = old_to_new[curr.random]
    curr = curr.next
  end

  old_to_new[head]
end
