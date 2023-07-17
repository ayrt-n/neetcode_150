# frozen_string_literal: true

require_relative './min_heap'

# Time complexity: O(n)
# Space complexity: O(n)
def find_kth_largest(nums, k)
  mh = MinHeap.new
  nums.each do |n|
    if mh.size < k
      mh.push(n)
    else
      mh.push(n) if mh.heap[0] < n
    end
    mh.pop until mh.size <= k
  end
  mh.pop
end
