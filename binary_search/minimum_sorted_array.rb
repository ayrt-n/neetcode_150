# frozen_string_literal: true

# Time complexity: Problem required to solve in O(logn)
# Space complexity: O(1)
def find_min(nums)
  l = 0
  r = nums.length - 1
  res = nums[0]

  while l <= r
    if nums[l] < nums[r]
      res = [res, nums[l]].min
      break
    end

    m = (l + r) / 2
    res = [res, nums[m]].min
    nums[m] >= nums[l] ? l = m + 1 : r = m - 1
  end

  res
end
