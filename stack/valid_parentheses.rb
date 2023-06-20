# frozen_string_literal:

# Time complexity: O(n)
# Space complexity: O(n)
def valid_parentheses?(s)
  stack = []

  (0...s.length).each do |i|
    char = s[i]
    if opening_bracket?(char)
      stack.push(char)
    elsif closing_bracket?(char)
      prev = stack.pop
      return false unless complete_bracket?(prev, char)
    end
  end

  stack.empty?
end

def opening_bracket?(char)
  ['(', '{', '['].include?(char)
end

def closing_bracket?(char)
  [')', '}', ']'].include?(char)
end

def complete_bracket?(open, close)
  case open
  when '('
    return true if close == ')'
  when '{'
    return true if close == '}'
  when '['
    return true if close == ']'
  end

  false
end
