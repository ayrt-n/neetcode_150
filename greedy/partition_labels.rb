# frozen_string_literal: true

require 'set'

# Count Solution
# Time complexity: O(n)
# Space complexity: O(1)
def partition_labels(s)
  res = []
  counts = Hash.new(0)
  s.each_char { |c| counts[c] += 1 }

  remaining = Set.new
  prev_partition = 0
  (0...s.length).each do |i|
    counts[s[i]] -= 1
    counts[s[i]].zero? ? remaining.delete(s[i]) : remaining << s[i]

    if remaining.empty?
      res << i + 1 - prev_partition
      prev_partition = i + 1
    end
  end

  res
end

# Final Index Solution
def partition_labels(s)
  res = []
  last_index = {}
  (0...s.length).each { |i| last_index[s[i]] = i }

  furthest = 0
  size = 0
  (0...s.length).each do |i|
    size += 1
    furthest = [furthest, last_index[s[i]]].max
    if furthest == i
      res << size
      size = 0
    end
  end

  res
end