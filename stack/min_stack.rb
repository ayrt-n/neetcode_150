# frozen_string_literal: true

# Requirement was for each operation to run in O(n) time
class MinStack
  def initialize
    @stack = nil
  end

  def push(val)
    if @stack.nil? || val < @stack.min
      new_min = val
    else
      new_min = @stack.min
    end

    @stack = ListNode.new(value: val, next_node: @stack, min: new_min)
  end

  def pop
    @stack = @stack.next_node
  end

  def top
    @stack.value
  end

  def min
    @stack.min
  end
end

# Linked List Class
class ListNode
  attr_reader :value, :next_node, :min

  def initialize(value: val, next_node: nil, min: nil)
    @value = value
    @next_node = next_node
    @min = min
  end
end
