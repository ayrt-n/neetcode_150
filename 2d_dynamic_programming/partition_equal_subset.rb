# frozen_string_literal: true

# Time complexity: O(sum(nums))
def can_partition(nums)
  sum = nums.sum
  return false if nums.sum % 2 == 1
  
  dp = Set.new([0])
  target = sum / 2
  (nums.length - 1).downto(0) do |i|
    tmp = Set.new

    dp.each do |n|
      new_sum = n + nums[i]
      return true if new_sum == target

      tmp << new_sum
    end

    dp += tmp
  end

  false
end
