# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def can_jump(nums)
  return true if nums.none?(&:zero?)

  last = nums.length - 1
  last.downto(0) do |i|
    last = i if i + nums[i] >= last
  end

  last.zero?
end
