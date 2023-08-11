# frozen_string_literal: true

# Time complexity:
# Space complexity:
def length_of_list(nums)
  dp = Array.new(nums.length) { 1 }

  (nums.length - 1).downto(0) do |i|
    (i + 1...nums.length).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max if nums[j] > nums[i]
    end
  end
end


# def length_of_lis(nums)
#   res = 1
#   memo = {}

#   (0...nums.length).each do |i|
#     res = [res, recurse(nums, i, memo)].max
#   end

#   res
# end

# def recurse(nums, index, memo, count = 1)
#   if index >= nums.length
#     memo[index] = count
#     return count
#   end

#   res = count
#   (index + 1...nums.length).each do |i|
#     if nums[i] > nums[index]
#       res = [res, recurse(nums, i, count + 1)].max
#     end
#   end

#   res
# end
