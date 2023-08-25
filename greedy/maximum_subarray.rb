# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def max_sub_array(nums)
  res = nums[0]
  sum = 0

  nums.each do |num|
    sum += num
    res = sum > res ? sum : res
    sum = 0 if sum.negative?
  end

  res
end
