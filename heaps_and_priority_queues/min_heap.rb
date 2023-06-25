# frozen_string_literal: true

# Min Heap class
class MinHeap
  attr_reader :heap

  def initialize(nums)
    build_heap(nums)
  end

  def pop
    return @heap.pop if @heap.size <= 1

    popped = @heap[0]
    @heap[0] = @heap.pop
    heapify_down

    popped
  end

  def push(val)
    length = @heap.length
    @heap[length] = val
    heapify_up

    @heap
  end

  def size
    @heap.length
  end

  private

  def build_heap(nums)
    @heap = []
    nums.each { |val| push(val) }
    @heap
  end

  def heapify_up
    c_ind = @heap.length - 1

    while parent?(c_ind)
      p_ind = parent_index(c_ind)
      parent = parent(c_ind)
      curr = @heap[c_ind]
      return if parent < curr

      swap(c_ind, p_ind)
      c_ind = p_ind
    end
  end

  def heapify_down
    c_ind = 0
    curr = @heap[c_ind]

    while left_child?(c_ind)
      smaller_index = left_child_index(c_ind)
      smaller_index = right_child_index(c_ind) if right_child?(c_ind) && right_child(c_ind) < left_child(c_ind)
      return if curr < @heap[smaller_index]

      swap(c_ind, smaller_index)
      c_ind = smaller_index
      curr = @heap[c_ind]
    end
  end

  def swap(ind1, ind2)
    @heap[ind1], @heap[ind2] = @heap[ind2], @heap[ind1]
  end

  def parent_index(index)
    (index - 1) / 2
  end

  def parent?(index)
    index >= 1
  end

  def parent(index)
    @heap[parent_index(index)]
  end

  def right_child_index(index)
    index * 2 + 2
  end

  def right_child?(index)
    right_child_index(index) < @heap.length
  end

  def right_child(index)
    @heap[right_child_index(index)]
  end

  def left_child_index(index)
    index * 2 + 1
  end

  def left_child?(index)
    left_child_index(index) < @heap.length
  end

  def left_child(index)
    @heap[left_child_index(index)]
  end
end
