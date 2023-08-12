# frozen_string_literal: true

# Time complexity: ~O(2^n)
def can_partition(nums)
  dfs(nums)
end

def dfs(nums, index = 0, sum1 = 0, sum2 = 0, memo = {})
  return sum1 == sum2 if index >= nums.length
  
  set = Set.new([sum1, sum2])
  return memo[set] if memo.has_key?(set)

  set1 = Set.new([sum1 + nums[index], sum2]) 
  memo[set1] = dfs(nums, index + 1, sum1 + nums[index], sum2, memo)
  return true if memo[set1]

  set2 = Set.new([sum1, sum2 + nums[index]]) 
  memo[set2] = dfs(nums, index + 1, sum1, sum2 + nums[index], memo)
  return true if memo[set2]

  false
end
