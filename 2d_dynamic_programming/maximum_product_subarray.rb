# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def max_product(nums)
  res = nums.max
  max, min = [1, 1]

  nums.each do |n|
    if n.zero?
      max, min = [1, 1]
      next
    end

    tmp = n * max
    max = [tmp, n * min, n].max
    min = [tmp, n * min, n].min
    res = [res, max].max
  end

  res
end
