# frozen_string_literal: true

require 'set'
require 'rubygems'
require 'algorithms'

# Time complexity: O(V + E)
def network_delay_time(times, n, k)
  res = 0
  graph = build_network_graph(times)
  visited = Set.new
  min_heap = Containers::MinHeap.new([[0, k]])

  until min_heap.empty? || visited.size == n
    ellapsed, node = min_heap.pop
    next if visited.include?(node)

    visited << node
    res = [res, ellapsed].max

    graph[node].each do |target_time, target_node|
      next if visited.include?(target_node)

      min_heap.push([ellapsed + target_time, target_node])
    end
  end

  visited.size == n ? res : -1
end

def build_network_graph(times)
  graph = Hash.new { |h, k| h[k] = [] }

  times.each do |src, target, time|
    graph[src] << [time, target]
  end

  graph
end
