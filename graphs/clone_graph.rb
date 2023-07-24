# frozen_string_literal: true

# Definition for a Node.
# class Node
#   attr_accessor :val, :neighbors
#   def initialize(val = 0, neighbors = nil)
#    @val = val
#    neighbors = [] if neighbors.nil?
#    @neighbors = neighbors
#   end
# end

# Time complexity:
# Space complexity:
def clone_graph(node)
  return nil unless node
  
  root = Node.new(node.val)
  orig_to_copy = { node => root }
  processed = {}
  queue = [node]

  until queue.empty?
    curr = queue.shift
    next if processed[curr]

    copy = orig_to_copy[curr]

    curr.neighbors.each do |nb|
      if orig_to_copy[nb]
        copy.neighbors << orig_to_copy[nb]
      else
        nb_copy = Node.new(nb.val)
        copy.neighbors << nb_copy
        orig_to_copy[nb] = nb_copy
      end

      queue << nb
    end

    processed[curr] = true
  end

  orig_to_copy.first[1]
end
