# frozen_string_literal: true

# Time complexity: O(V + E)
def find_redundant_connection(edges)
  graph = {}
  edges.each do |vertex, neighbour|
    check_cycle = graph[vertex] && graph[neighbour]

    graph[vertex] = [] unless graph[vertex]
    graph[neighbour] = [] unless graph[neighbour]
    graph[vertex] << neighbour
    graph[neighbour] << vertex

    return [vertex, neighbour] if check_cycle && cycle?(graph, vertex)
  end
end

def cycle?(graph, start)
  visited = Set.new
  queue = [[start, nil]]

  until queue.empty?
    node, origin = queue.shift
    return true if visited.include?(node)

    visited << node
    graph[node].each { |neighbour| queue << [neighbour, node] unless neighbour == origin }
  end

  false
end
