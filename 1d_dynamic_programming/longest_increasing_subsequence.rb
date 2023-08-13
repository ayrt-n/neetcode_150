# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: O(n)
def length_of_list(nums)
  dp = Array.new(nums.length) { 1 }

  (nums.length - 1).downto(0) do |i|
    (i + 1...nums.length).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max if nums[j] > nums[i]
    end
  end

  dp.max
end
