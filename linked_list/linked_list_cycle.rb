# frozen_string_literal: true

# Definition for singly-linked list
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# CONSTANT SPACE SOLUTION
# Time complexity: O(n)
# Space complexity: O(1)
def cycle?(head)
  slow = head
  fast = head

  until fast.nil? || fast.next.nil?
    slow = slow.next
    fast = fast.next.next

    return true if slow == fast
  end

  false
end

# LINEAR SPACE SOLUTION
# Time complexity: O(n)
# Space complexity: O(n)
# def cycle?(head)
#   visited = {}
#   curr = head

#   until curr.nil?
#     return true if visited[curr]

#     visited[curr] = true
#     curr = curr.next
#   end

#   false
# end
