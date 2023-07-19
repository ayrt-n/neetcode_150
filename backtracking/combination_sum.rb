# frozen_string_literal: true

# Time complexity:O(n * 2^n)
# Space complexity: O(n * 2^n)
def combination_sum(candidates, target, res = [], combination = [])
  res.push(combination.dup) if combination.sum == target
  return if combination.sum >= target

  candidates.each do |c|
    combination.push(c)
    combination_sum(candidates, target, res, combination)
    combination.pop
  end

  res
end
