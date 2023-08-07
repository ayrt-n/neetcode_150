# frozen_string_literal: true

# Time complexity: O(amount * coins)
# Space complexity: O(amount)
def coin_change(coins, amount)
  dp = Array.new(amount + 1) { Float::INFINITY }
  dp[0] = 0

  (1..amount).each do |a|
    coins.each do |c|
      dp[a] = [dp[a], 1 + dp[a - c]].min if a - c >= 0
    end
  end

  dp[amount] == Float::INFINITY ? -1 : dp[amount]
end
