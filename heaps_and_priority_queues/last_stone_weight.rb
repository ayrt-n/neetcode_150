# frozen_string_literal: true

require_relative './max_heap'

# Time complexity: Building stones heap O(n), Smashing stones O(nlogn)
# Space complexity: O(n)
def last_stone_weight(stones)
  remaining = MaxHeap.new(stones)

  until remaining.size <= 1
    stone1 = remaining.pop
    stone2 = remaining.pop
    smashed = stone1 - stone2

    remaining.push(smashed) if smashed.positive?
  end

  remaining.heap[0] || 0
end
