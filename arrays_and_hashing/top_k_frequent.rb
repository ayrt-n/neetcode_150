# frozen_string_literal: true

# Time complexity: O(n * logn)
# Space complexity: O(n)
def top_k_frequent(nums, k)
  result = Hash.new(0)
  nums.each { |n| result[n] += 1 }

  most_frequent = result.max_by(k) { |_k, v| v }
  most_frequent.map { |kv| kv[0] }
end
