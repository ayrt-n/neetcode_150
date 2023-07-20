# frozen_string_literal: true

# Time complexity: O(n * 2^n)
# Space complexity: O(n * 2^n)
def combination_sum2(candidates, target)
  sorted = candidates.sort
  backtrack(sorted, target)
end

def backtrack(nums, target, index = 0, res = [], combination = [])
  candidate_sum = combination.sum
  res.push(combination.dup) if candidate_sum == target
  return if candidate_sum >= target || index >= nums.length

  combination.push(nums[index])
  backtrack(nums, target, index + 1, res, combination)

  prior_num = combination.pop
  index += 1 until nums[index] != prior_num
  backtrack(nums, target, index, res, combination)

  res
end
