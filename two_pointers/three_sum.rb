# frozen_string_literal: true

# Time complexity: O(n^2)
# Space complexity: O(1) or O(n)
def three_sum(nums)
  res = []
  sorted = nums.sort
  length = nums.length

  (0..length - 3).each do |i1|
    return res.keys if sorted[i1].positive?
    next if i1.positive? && sorted[i1] == sorted[i1 - 1]

    i2 = i1 + 1
    i3 = length - 1

    while i2 < i3
      triplet = [sorted[i1], sorted[i2], sorted[i3]]
      sum = triplet.reduce(&:+)

      if sum.positive?
        i3 -= 1
      elsif sum.negative?
        i2 += 1
      else
        res << triplet
        i2 += 1
        i2 += 1 while sorted[i2] == sorted[i2 - 1] && i2 < i3
      end
    end
  end

  res
end
