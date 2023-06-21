# frozen_string_literal: true

# Definition of singly-linked list
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def merge_two_lists(list1, list2)
  result = ListNode.new
  result_tail = result

  while list1 && list2
    if list1.val <= list2.val
      result_tail.next = list1
      list1 = list1.next
    else
      result_tail.next = list2
      list2 = list2.next
    end

    result_tail = result_tail.next
  end

  result_tail.next = list1 || list2
  linked_list_to_array(result.next)
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
