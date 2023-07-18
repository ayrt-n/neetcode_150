# frozen_string_literal: true

# Time complexity: O(n * 2^n)
# Space complexity: O(n * 2^n)
def subsets(nums, index = 0, res = [], subset = [])
  if index >= nums.length
    res.push(subset.dup)
    return
  end

  # Decision to add nums[i] to subset
  subset.push(nums[index])
  subsets(nums, index + 1, res, subset)

  # Decision to not add nums[i] to subset
  subset.pop
  subsets(nums, index + 1, res, subset)

  return res
end
