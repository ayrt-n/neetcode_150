# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def top_k_frequent(nums, k)
  result = []
  counts_array = Array.new(nums.length + 1) { [] }
  counts_hash = Hash.new(0)
  nums.each { |n| counts_hash[n] += 1 }

  counts_hash.each do |k, v|
    counts_array[v] << k
  end

  counts_array.reverse_each do |v|
    next if v.empty?

    result += v
    break if result.length == k
  end

  result
end
