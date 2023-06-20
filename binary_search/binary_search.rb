# frozen_string_literal: true

# Time complexity: O(logn)
# Space complexity: O(1)
def loop_search(nums, target)
  low = 0
  high = nums.length - 1

  while low <= high
    mid_i = (low + high) / 2
    mid_v = nums[mid_i]
    return mid_i if mid_v == target

    mid_v > target ? high = mid_i - 1 : low = mid_i + 1
  end

  -1
end
