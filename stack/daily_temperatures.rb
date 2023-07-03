# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def daily_temperatures(temperatures)
  res = Array.new(temperatures.length) { 0 }
  stack = [{ temp: temperatures[0], index: 0 }]

  1.upto(temperatures.length - 1) do |i|
    while !stack.empty? && temperatures[i] > stack[-1][:temp]
      prev_temp = stack.pop
      res[prev_temp[:index]] = i - prev_temp[:index]
    end
    stack << { temp: temperatures[i], index: i }
  end

  res
end
