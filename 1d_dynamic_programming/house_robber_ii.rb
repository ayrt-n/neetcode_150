# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def rob(nums)
  return nums[0] if nums.length == 1

  [maximize_rob_value(nums[0...-1]), maximize_rob_value(nums[1..])].max
end

def maximize_rob_value(nums)
  rob_one_prior = 0
  rob_two_prior = 0

  (0...nums.length).each do |i|
    tmp = [nums[i] + rob_two_prior, rob_one_prior].max
    rob_two_prior = rob_one_prior
    rob_one_prior = tmp
  end

  rob_one_prior
end
