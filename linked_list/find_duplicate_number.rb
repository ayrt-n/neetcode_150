# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: Problem requirement of O(1)
# Must not modify original array
def find_duplicate(nums)
  slow = nums[nums[0]]
  fast = nums[nums[nums[0]]]

  # Find the first intersection by iterating slow by one, fast by two
  until slow == fast
    slow = nums[slow]
    fast = nums[nums[fast]]
  end

  # Find the intersection by iterating pointers by one
  slow = nums[0]
  until slow == fast
    slow = nums[slow]
    fast = nums[fast]
  end

  # Intersection is the repeated number
  slow
end
