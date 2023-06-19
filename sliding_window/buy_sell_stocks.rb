# frozen_string_literal: true

# Brute force method
def max_profit(prices)
  length = prices.length
  lowest_buy = Float::INFINITY
  max = 0

  (0..length - 2).each do |buy_i|
    next if prices[buy_i] > lowest_buy
    next if prices[buy_i + 1] <= prices[buy_i]

    lowest_buy = prices[buy_i]

    (buy_i..length - 1).each do |sell_i|
      profit = prices[sell_i] - prices[buy_i]
      next if profit.negative? || profit < max

      max = profit
    end
  end

  max
end
