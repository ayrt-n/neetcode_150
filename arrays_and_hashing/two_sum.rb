# frozen_string_literal: true

# Brute force solution
# Time complexity: O(n^2)
# Space complexity: O(n)
def bf_two_sum(nums, target)
  length = nums.length

  nums.each_with_index do |n, i|
    solution = target - n

    (i + 1..length).each do |solution_i|
      return [i, solution_i] if nums[solution_i] == solution
    end
  end
end
