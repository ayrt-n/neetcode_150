# frozen_string_literal: true

# DFS + Memoization Solution
# Time complexity: O(nums * sum)
# Space complexity: O(nums * sum)
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

# Dynamic Programming Solution
# Time complexity: O(nums * sum)
# Space complexity: O(nums * sum)
def find_target_sum_ways(nums, target)
  sum = nums.sum
  dp = Array.new(nums.length + 1) { Hash.new { |h, k| h[k] = 0 } }
  dp[-1][target] = 1

  (nums.length - 1).downto(0) do |i|
    (-sum).upto(sum) do |j|
      a = j + nums[i]
      m = j - nums[i]

      dp[i][j] += dp[i + 1][a] + dp[i + 1][m]
    end
  end

  dp[0][0]
end
