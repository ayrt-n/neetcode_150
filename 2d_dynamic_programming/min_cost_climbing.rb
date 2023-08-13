# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def min_cost_climbing_stairs(cost)
  length = cost.length
  dp = Array.new(length)
  (0...length).each do |i|
    cost1 = dp[length - i] || 0
    cost2 = dp[length - i + 1] || 0

    dp[length - 1 - i] = cost[length - 1 - i] + [cost1, cost2].min
  end

  dp[0] < dp[1] ? dp[0] : dp[1]
end
