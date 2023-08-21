# frozen_string_literal: true

# Memoization/Caching Solution
# Time complexity: O(coins * amount)
# Space complexity: O(coins * amount)
def change(amount, coins)
  dfs(amount, 0, coins)
end

def dfs(target, index, coins, cache = {})
  return 1 if target.zero?
  return 0 if target.negative? || index >= coins.length
  return cache[[target, index]] if cache[[target, index]]

  cache[[target, index]] = dfs(target - coins[index], index, coins, cache) +
                           dfs(target, index + 1, coins, cache)

  cache[[target, index]]
end

# Dynamic Programming Solution
# Time complexity: O(coins * amount)
# Space complexity: O(coins * amount)
def change(amount, coins)
  num_coins = coins.length
  dp = Array.new(num_coins) { Array.new(amount + 1) }
  dp.each_index { |row| dp[row][-1] = 1 }

  (amount - 1).downto(0) do |a|
    (num_coins - 1).downto(0) do |i|
      combos = 0
      combos += dp[i + 1][a] if (i + 1) < dp.length
      combos += dp[i][a + coins[i]] unless (a + coins[i]) > amount

      dp[i][a] = combos
    end
  end

  dp[0][0]
end
