# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def check_valid_string(s)
  left_min, left_max = [0, 0, 0]

  s.each_char do |c|
    if c == '('
      left_max += 1
      left_min += 1
    elsif c == ')'
      left_max -= 1
      left_min -= 1
    else
      left_max += 1
      left_min -= 1
    end

    left_min = [0, left_min].max
    return false if left_max.negative?
  end

  left_min.zero?
end