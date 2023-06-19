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

# Better solution, using hash
# Time complexity: O(n)
# Space complexity: O(n)
def two_sum(nums, target)
  nums_hash = {}

  nums.each_with_index do |n1, i1|
    solution = target - n1
    i2 = nums_hash[solution]
    return [i1, i2] if i2

    nums_hash[n1] = i1
  end

  nil
end
