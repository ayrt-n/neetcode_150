# frozen_string_literal: true

def generate_parenthesis(n, stack = [], res = [], open = 0, closed = 0)
  if open == n && closed == n
    res << stack.join
    return
  end

  if open < n
    stack << '('
    generate_parenthesis(n, stack, res, open + 1, closed)
    stack.pop
  end

  if closed < open
    stack << ')'
    generate_parenthesis(n, stack, res, open, closed + 1)
    stack.pop
  end

  res
end
