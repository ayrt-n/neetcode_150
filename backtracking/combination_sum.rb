# frozen_string_literal: true

# Time complexity:O(2 ^ t) where t is the target value
def combination_sum(candidates, target, res = [], combination = [])
  res.push(combination.dup) if combination.sum == target
  return if combination.sum >= target

  (0...candidates.length).each do |i|
    combination.push(candidates[i])
    combination_sum(candidates[i..], target, res, combination)
    combination.pop
  end

  res
end
