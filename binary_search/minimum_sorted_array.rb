# frozen_string_literal: true

# Time complexity: Problem required to solve in O(logn)
# Space complexity: O(1)
def find_min(nums)
  l = 0
  r = nums.length - 1

  while l < r
    m = (l + r) / 2
    mval = nums[m]
    return mval if mval < nums[m - 1] && mval < nums[m + 1]

    nums[m - 1] < nums[r] ? r = m - 1 : l = m + 1
  end

  nums[l]
end
