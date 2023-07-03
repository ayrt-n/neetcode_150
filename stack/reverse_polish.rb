# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def eval_rpn(tokens)
  stack = []
  
  tokens.each do |t|
    if int?(t)
      stack << t.to_i
    else
      op2 = stack.pop
      op1 = stack.pop
      stack.push(evaluate_formula(op1, op2, t))
    end
  end

  stack[0]
end

def int?(char)
  char.match(/[0-9]/) ? true : false
end

def evaluate_formula(op1, op2, operand)
  case operand
  when '+'
    op1 + op2
  when '-'
    op1 - op2
  when '*'
    op1 * op2
  when '/'
    # HACK: Ruby handles negative integer division differently than leetcode wants, this ensures values rounded towards zero
    Integer(Float(op1) / Float(op2))
  else
    raise StandardError.new("Invalid operand")
  end
end
