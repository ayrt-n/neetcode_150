# frozen_string_literal: true

# Time complexity: O(n * logm) where m is the max value of piles and n is the number of piles
# Space complexity: O(n)
def min_eating_speed(piles, h)
  min = 1
  max = piles.max
  res = max

  while min <= max
    mid = (min + max) / 2
    hours_required = time_to_eat_piles(piles, mid)

    if hours_required <= h
      res = [res, mid].min
      max = mid - 1
    else
      min = mid + 1
    end
  end

  res
end

def time_to_eat_piles(piles, k)
  hours_per_pile = piles.map { |pile| (pile / k.to_f).ceil }
  hours_per_pile.reduce(&:+)
end
