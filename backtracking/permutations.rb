# frozen_string_literal: true

# Time complexity:
# Space complexity:
def permute(nums, res = [], perm = [])
  res.push(perm.dup) && return if nums.empty?

  (0...nums.length).each do |i|
    perm.push(nums[i])
    permute(nums[0...i] + nums[i + 1..], res, perm)
    perm.pop
  end

  res
end
