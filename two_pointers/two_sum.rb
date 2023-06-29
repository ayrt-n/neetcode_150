# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def two_sum(numbers, target)
  i1 = 0
  i2 = numbers.length - 1

  while i1 <= i2
    sum = numbers[i1] + numbers[i2]
    return [i1 + 1, i2 + 1] if sum == target

    sum > target ? i2 -= 1 : i1 += 1
  end
end
