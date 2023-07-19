# frozen_string_literal: true

# Time complexity: O(n * 2^n)
# Space complexity: O(n * 2^n)
def subsets_with_dup(nums)
  sorted = nums.sort
  backtracking(sorted)
end

# Takes array of sorted nums and solves for all subsets
def backtracking(nums, index = 0, res = [], subset = [])
  if index >= nums.length
    res.push(subset.dup)
    return
  end

  subset.push(nums[index])
  backtracking(nums, index + 1, res, subset)
  subset.pop

  next_index = index
  next_index += 1 until nums[next_index] != nums[index]
  backtracking(nums, next_index, res, subset)

  res
end
