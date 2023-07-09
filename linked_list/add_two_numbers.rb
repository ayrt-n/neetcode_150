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
def add_two_numbers(l1, l2)
  res = ListNode.new
  l1_node = l1
  l2_node = l2
  curr = res
  carry = 0

  until l1_node.nil? && l2_node.nil?
    curr.next = ListNode.new
    curr = curr.next

    sum = carry
    sum += l1_node.nil? ? 0 : l1_node.val
    sum += l2_node.nil? ? 0 : l2_node.val

    curr.val = sum % 10

    l1_node = l1_node.next unless l1_node.nil?
    l2_node = l2_node.next unless l2_node.nil?
  end

  curr.next = ListNode.new(carry) if carry.positive?
  res.next
end
