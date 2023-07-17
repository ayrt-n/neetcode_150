# frozen_string_literal: true

require 'rubygems'
require 'algorithms'

# Time complexity: O(n)
# Space complexity: O(1)
def least_interval(tasks, n)
  cooldown = []
  res = 0
  task_counts = Hash.new(0)
  tasks.each { |task| task_counts[task] += 1 }
  remaining = Containers::MaxHeap.new(task_counts.values)

  until remaining.empty? && cooldown.empty?
    res += 1
    task = remaining.pop

    # Add task to cooldown queue if task has greater than one remaining
    cooldown.push([task, res + n]) if task && task > 1

    # Pop from cooldown queue if cooldown is done
    remaining.push(cooldown.shift[0]) if cooldown[0] && cooldown[0][1] == res
  end

  res
end
