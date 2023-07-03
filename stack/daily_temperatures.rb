# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: O(n)
def daily_temperatures(temperatures)
  res = []

  0.upto(temperatures.length - 2) do |i|
    count = 0

    (i + 1).upto(temperatures.length - 1) do |j|
      count += 1
      if temperatures[i] < temperatures[j]
        res << count
        break
      end
      if j == temperatures.length - 1
        res << 0
        break
      end
    end
  end

  res.push(0)
end
