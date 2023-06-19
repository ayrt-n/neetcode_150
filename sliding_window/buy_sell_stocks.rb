# frozen_string_literal: true

# Brute force method
def max_profit(prices)
  left = 0 
  right = 1
  max = 0

  while right < prices.length
    if prices[right] > prices[left]
      profit =  prices[right] - prices[left]
      max = [max, profit].max
    else
      left = right
    end
    right += 1
  end

  max
end