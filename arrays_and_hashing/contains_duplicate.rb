# frozen_string_literal: true

# Time Complexity: O(n)
# Space Complexity: O(n)
def contains_duplicate(nums)
  nums_hash = {}

  nums.each do |n|
    return true if nums_hash[n]

    nums_hash[n] = true
  end

  false
end
