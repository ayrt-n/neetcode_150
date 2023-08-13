# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def climb_stairs(n)
  steps = Array.new(n + 2)
  steps[0], steps[1] = 0, 1

  (2...n + 2).each do |i|
    steps[i] = steps[i - 1] + steps[i - 2]
  end

  steps[-1]
end
