# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def max_profit(prices)
  # State: Buying (i + 1), Selling (i + 2)
  # Cache: Key = [index, buying], Val = max_profit
  dp = {}
  dfs(prices, 0, true, dp)
  dp[[0, true]]
end

def dfs(prices, index, buying, cache)
  return 0 if index >= prices.length
  return cache[[index, buying]] if cache[[index, buying]]

  if buying
    buy_profit = dfs(prices, index + 1, false, cache) - prices[index]
    cache[[index, buying]] = [
      buy_profit,
      dfs(prices, index + 1, true, cache),
      0
    ].max
  else
    sell_profit = prices[index] + dfs(prices, index + 2, true, cache)
    cache[[index, buying]] = [
      sell_profit,
      dfs(prices, index + 1, false, cache),
      0
    ].max
  end
end
