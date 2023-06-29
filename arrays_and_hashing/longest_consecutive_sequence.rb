# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def longest_consecutive(nums)
  # Convert nums array into hash
  nums_hash = nums.reduce({}) do |h, n|
                h[n] = true
                h
              end

  longest = 0
  nums.each do |n|
    # If it is not the start of the sequence, skip
    next if nums_hash[n - 1]

    # Count while sequence continues
    count = 1
    count += 1 while nums_hash[n + count]
    longest = count if count > longest
  end

  longest
end
