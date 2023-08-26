# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def can_complete_circuit(gas, cost)
  return -1 if gas.sum < cost.sum

  total = 0
  start = 0

  (0...gas.length).each do |i|
    total += gas[i] - cost[i]

    if total.negative?
      start = i + 1
      total = 0
    end
  end

  start
end