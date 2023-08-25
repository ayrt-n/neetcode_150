# frozen_string_literal: true

# Greedy Solution
# Time complexity: O(n)
# Space complexity: O(1)
def jump(nums)
  res = 0
  left, right = [0, 0]

  while right < nums.length - 1
    farthest = 0
    (left..right).each { |i| farthest = [farthest, i + nums[i]].max }
    left = right + 1
    right = farthest
    res += 1
  end

  res
end

# Dynamic Programming Solution
# Time complexity: O(n^2)
# Space complexity: O(n)
def jump(nums)
  goal = nums.length - 1
  dp = Array.new(nums.length) { Float::INFINITY }
  dp[goal] = 0

  (goal - 1).downto(0) do |i|
    if nums[i] + i >= goal
      dp[i] = 1
      next
    end

    (i + 1).upto(i + nums[i]) { |j| dp[i] = [dp[i], dp[j] + 1].min }
  end

  dp[0]
end
