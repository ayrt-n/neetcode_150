# frozen_string_literal: true

require_relative './min_heap'

# Class designed to find the kth largest element in a stream
# Time complexity: Building k-heap O(nlogn), Pushing to heap O(logn), Popping from heap O(logn)
# Space complexity: O(n)
class KthLargest
  def initialize(k, nums)
    @k = k
    @min_heap = MinHeap.new(nums)
    @min_heap.pop until @min_heap.size == k
  end

  def add(val)
    @min_heap.push(val) if val > @min_heap.heap[0]
    @min_heap.pop until @min_heap.size == @k

    @min_heap.heap[0]
  end
end
