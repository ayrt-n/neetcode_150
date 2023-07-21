# frozen_string_literal: true

DIGIT_MAPPING = {
  '2' => ['a', 'b', 'c'],
  '3' => ['d', 'e', 'f'],
  '4' => ['g', 'h', 'i'],
  '5' => ['j', 'k', 'l'],
  '6' => ['m', 'n', 'o'],
  '7' => ['p', 'q', 'r', 's'],
  '8' => ['t', 'u', 'v'],
  '9' => ['w', 'x', 'y', 'z']
}

# Time complexity: O(3^n)
# Space complexity: O(3^n)
def letter_combinations(digits)
  backtrack(digits) || []
end

def backtrack(digits, index = 0, res = [], combo = '')
  res.push(combo.dup) && return if index >= digits.length

  DIGIT_MAPPING[digits[index]].each do |c|
    combo += c
    backtrack(digits, index + 1, res, combo)
    combo.chop!
  end

  res
end
