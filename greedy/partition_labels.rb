# frozen_string_literal: true

require 'set'

# Time complexity:
# Space complexity:
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
