# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def k_closest(points, k)
  mdh = MaxDistanceHeap.new
  points.each do |point|
    if mdh.size < k
      mdh.push(point)
    else
      mdh.push(point)
      mdh.pop until mdh.size <= k
    end
  end
  mdh.heap
end

# Implementation of Max Heap
class MaxDistanceHeap
  attr_reader :heap

  def initialize
    @heap = []
  end

  def push(val)
    length = @heap.length
    @heap[length] = val
    heapify_up

    val
  end

  def pop
    tmp = @heap[0]
    @heap[0] = @heap.pop
    heapify_down

    tmp
  end

  def distance(point1)
    Math.sqrt((0 - point1[0])**2 + (0 - point1[1])**2)
  end

  def size
    @heap.size
  end

  private

  def heapify_up
    return if @heap.empty?

    index = @heap.length - 1
    while parent?(index)
      p_ind = parent_index(index)
      break if distance(@heap[p_ind]) > distance(@heap[index])

      swap(p_ind, index)
      index = p_ind
    end
  end

  def heapify_down
    return if @heap.empty?

    index = 0
    while left_child?(index)
      max_index = left_index(index)

      if right_child?(index)
        max_index = right_index(index) if distance(@heap[right_index(index)]) > distance(@heap[max_index])
      end

      break if distance(@heap[index]) > distance(@heap[max_index])

      swap(index, max_index)
      index = max_index
    end
  end

  def swap(i1, i2)
    @heap[i1], @heap[i2] = @heap[i2], @heap[i1]
  end

  def left_index(index)
    index * 2 + 1
  end

  def right_index(index)
    index * 2 + 2
  end

  def parent_index(index)
    (index - 1) / 2
  end

  def left_child?(index)
    left_index(index) < @heap.length
  end

  def right_child?(index)
    right_index(index) < @heap.length
  end

  def parent?(index)
    index.positive?
  end
end