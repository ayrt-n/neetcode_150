# frozen_string_literal: true

# Time complexity: O(n * logn)
# Space complexity: O(1)
def two_sum(numbers, target)
  numbers.each_with_index do |n, i1|
    diff = target - n
    i2 = index(numbers, diff, i1 + 1)

    return [i1 + 1, i2 + 1] if i2
  end
end

def index(numbers, target, low = 0, high = numbers.length - 1)
  while low <= high
    mid = (low + high) / 2
    res = numbers[mid]
    return low + mid if res == target

    res < diff ? low = mid + 1 : high = mid - 1
  end

  nil
end
