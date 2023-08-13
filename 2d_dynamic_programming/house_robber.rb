# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def rob(nums)
  res = [0, 0] + Array.new(nums.length)

  (0...nums.length).each do |i|
    steal_value = nums[i] + res[i]
    prior_value = res[i + 1]

    res[i + 2] = [steal_value, prior_value].max
  end

  res[-1]
end
