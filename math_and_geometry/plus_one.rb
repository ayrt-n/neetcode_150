# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def plus_one(digits)
  num = digits_to_num(digits)
  num += 1
  num_to_digits(num)
end

def digits_to_num(digits)
  result = 0
  exp = digits.length - 1
  digits.each do |n|
    result += n * 10**exp
    exp -= 1
  end
  result
end

def num_to_digits(num)
  str = num.to_s
  str.chars.map(&:to_i)
end
