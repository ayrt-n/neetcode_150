# frozen_string_literal: true

# Time complexity: Set operation O(n), Get operation O(logn)
# Space complexity: O(n)
class TimeMap
  def initialize
    @keys = Hash.new { |h, k| h[k] = [] }
  end

  # From problem: All timestamps of set are strictly increasing
  def set(key, value, timestamp)
    @keys[key] << TimeValue.new(timestamp, value)
  end

  def get(key, timestamp)
    timevalues = @keys[key]
    l, r = [0, timevalues.length - 1]
    res = TimeValue.new(-Float::INFINITY, '')

    while l <= r
      m = (l + r) / 2
      return timevalues[m].value if timevalues[m].timestamp == timestamp

      if timevalues[m].timestamp <= timestamp
        res = res.timestamp > timevalues[m].timestamp ? res : timevalues[m]
      end

      timevalues[m].timestamp < timestamp ? l = m + 1 : r = m - 1
    end

    res.value
  end
end

class TimeValue
  attr_reader :timestamp, :value

  def initialize(timestamp, value)
    @timestamp = timestamp
    @value = value
  end
end
