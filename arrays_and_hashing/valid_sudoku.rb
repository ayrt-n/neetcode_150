# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def valid_sudoku?(board)
  combinations = Hash.new { |h, k| h[k] = Array.new(9) }

  9.times do |r|
    row = "row-#{r}"
    9.times do |c|
      next if board[r][c] == '.'

      val = board[r][c].to_i
      col = "col-#{c}"
      box = "box-#{(c / 3) + (r / 3) * 3}"

      return false if combinations[row][val] || combinations[box][val] || combinations[col][val]

      combinations[row][val] = true
      combinations[col][val] = true
      combinations[box][val] = true
    end
  end

  true
end
