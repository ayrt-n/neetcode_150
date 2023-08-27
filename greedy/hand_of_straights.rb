# frozen_string_literal: true

# Time complexity: O(n * logn)
# Space complexity: O(n)
def is_n_straight_hand(hand, group_size)
  return false unless (hand.length % group_size).zero?

  counts = Hash.new(0)
  hand.each { |v| counts[v] += 1 }
  values = counts.keys.sort

  i = 0
  until i >= values.length
    if counts[values[i]].zero?
      i += 1
      next
    end

    (0...group_size).each do |j|
      return false if counts[values[i] + j].zero?
      counts[values[i] + j] -= 1
    end
  end

  true
end
