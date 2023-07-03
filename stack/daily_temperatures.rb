# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def daily_temperatures(temperatures)
  res = Array.new(temperatures.length) { 0 }
  stack = [{ temp: temperatures[0], index: 0 }]

  1.upto(temperatures.length - 1) do |i|
    until stack.empty? || temperatures[i] <= stack[-1][:temp]
      j = stack.pop[:index]
      res[j] = i - j
    end
    stack << { temp: temperatures[i], index: i }
  end

  res
end
