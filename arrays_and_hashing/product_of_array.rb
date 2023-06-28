# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def product_except_self(nums)
  length = nums.length
  pre = Array.new(length)
  pre[0] = 1
  post = Array.new(length)
  post[-1] = 1
  prod = Array.new(length)

  (1..length - 1).each do |i|
    pre[i] = pre[i - 1] * nums[i - 1]
    post[length - 1 - i] = post[length - i] * nums[length - i]
  end

  (0..length - 1).each do |i|
    prod[i] = pre[i] * post[i]
  end

  prod
end
