# frozen_string_literal: true

# Time complexity: O(C + P)
def can_finish(num_courses, prerequisites)
  prereqs_graph = build_prerequisites_graph(prerequisites)

  (0...num_courses).each do |course|
    return false unless dfs(course, prereqs_graph)
  end

  true
end

def dfs(course, prereqs, visited = Set.new)
  return false if visited.include?(course)

  visited << course

  prereqs[course].each do |prereq|
    return false unless dfs(prereq, prereqs, visited)

    prereqs[course].delete(prereq)
  end

  visited.delete(course)

  true
end

def build_prerequisites_graph(prerequisites)
  res = Hash.new { |h, k| h[k] = [] }
  prerequisites.each { |p| res[p[0]] << p[1] }

  res
end
