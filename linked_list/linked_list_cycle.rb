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
def cycle?(head)
  visited = {}
  curr = head

  until curr.nil?
    return true if visited[curr]

    visited[curr] = true
    curr = curr.next
  end

  false
end
