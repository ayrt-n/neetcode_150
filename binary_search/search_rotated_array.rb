# frozen_string_literal: true

# Time complexity: Requirement for O(logn)
# Space complexity: O(1)
def search(nums, target)
  l = 0
  r = nums.length - 1

  while l <= r
    m = (l + r) / 2
    return m if nums[m] == target

    if nums[l] <= nums[m]
      target >= nums[l] && target < nums[m] ? r = m - 1 : l = m + 1
    else
      target > nums[m] && target <= nums[r] ? l = m + 1 : r = m - 1
    end
  end

  -1
end
