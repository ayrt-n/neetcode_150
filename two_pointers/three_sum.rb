# frozen_string_literal: true

# Time complexity: O(n^3)
# Space complexity: O(n)
def three_sum(nums)
  res = []
  length = nums.length

  0.upto(length - 1) do |i1|
    (i1 + 1).upto(length - 1) do |i2|
      (i2 + 1).upto(length - 1) do |i3|
        sum = nums[i1] + nums[i2] + nums[i3]
        if sum.zero?
          triplet = [nums[i1], nums[i2], nums[i3]]
          res << triplet if sum.zero? && !contains_duplicate?(res, triplet)
        end
      end
    end
  end

  res
end

def contains_duplicate?(set, arr)
  set.each do |subset|
    return true if (subset - arr).empty? && (arr - subset).empty?
  end
  false
end
