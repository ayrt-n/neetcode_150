# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: Problem requirement of O(1)
# Must not modify original array
def find_duplicates(nums)
  (0...nums.length).each do |i|
    num = nums[i]
    (i + 1...nums.length).each do |j|
      return num if num == nums[j]
    end
  end
end
