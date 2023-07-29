# frozen_string_literal: true

# Time complexity: O(C + P)
def find_order(num_courses, prerequisites)
  prereq_graph = build_prereqs_graph(prerequisites)
  res = []

  (0...num_courses).each do |course|
    next if prereq_graph[course].nil?

    return [] unless dfs(course, prereq_graph, res)
  end

  res
end

def dfs(course, prereq_graph, res, visited = Set.new)
  return false if visited.include?(course)

  visited << course

  prereq_graph[course].each do |prereq|
    next if prereq_graph[prereq].nil?
    return false unless dfs(prereq, prereq_graph, res, visited)
  end

  visited.delete(course)
  prereq_graph[course] = nil
  res << course

  true
end

def build_prereqs_graph(prereqs)
  res = Hash.new { |h, k| h[k] = [] }

  prereqs.each do |prereq|
    res[prereq[0]] << prereq[1]
  end

  res
end
