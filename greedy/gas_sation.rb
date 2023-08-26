# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def can_complete_circuit(gas, cost)
  (0...gas.length).each do |i|
    tank = 0
    (0...gas.length).each do |j|
      index = (i + j) % gas.length
      tank += gas[index]
      tank -= cost[index]
      break if tank.negative?
    end

    return i if tank >= 0
  end
  -1
end