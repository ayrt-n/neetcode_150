# frozen_string_literal: true

# DFS + Memoization Solution
# Time complexity: O(nums)
# Space complexity: O(nums)
def find_target_sum_ways(nums, target)
  dfs(nums, 0, target, 0)
end

def dfs(nums, index, target, sum, cache = {})
  return 1 if index >= nums.length && target == sum
  return 0 if index >= nums.length
  return cache[[index, sum]] if cache[[index, sum]]

  cache[[index, sum]] = 0
  cache[[index, sum]] += dfs(nums, index + 1, target, sum + nums[index], cache)
  cache[[index, sum]] += dfs(nums, index + 1, target, sum - nums[index], cache)
end