# frozen_string_literal: true

# BELLMAN-FORD IMPLEMENTATION
def find_cheapest_price(n, flights, src, dst, k)
  prices = Array.new(n) { Float::INFINITY }
  prices[src] = 0

  (k + 1).times do
    tmp = prices.dup
    flights.each do |from, to, price|
      next if prices[from] == Float::INFINITY

      tmp[to] = prices[from] + price if prices[from] + price < tmp[to]
    end
    prices = tmp
  end

  prices[dst] == Float::INFINITY ? -1 : prices[dst]
end

# DJIKSTRAS IMPLEMENTATION
# def find_cheapest_price(n, flights, src, dst, k)
#   graph = build_flight_graph(flights)
#   visited = Set.new
#   min_heap = Containers::MinHeap.new([[0, 0, src]])

#   until min_heap.empty?
#     cost, stops, loc = min_heap.pop
#     return cost if loc == dst
#     next if stops > k

#     graph[loc].each do |to, price|
#       next if visited.include?(to)

#       min_heap.push([cost + price, stops + 1, to])
#     end
#   end

#   -1
# end

# def build_flight_graph(flights)
#   graph = Hash.new { |h, k| h[k] = [] }
#   flights.each do |from, to, price|
#     graph[from] << [to, price]
#   end
#   graph
# end
