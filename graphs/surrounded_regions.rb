# frozen_string_literal: true

# Time complexity: O(m*n)
# Space complexity: O(m*n)
def solve(board)
  rows, cols = [board.length, board[0].length]
  not_captured = Set.new

  (0...rows).each do |r|
    dfs(board, r, 0, not_captured)
    dfs(board, r, cols - 1, not_captured)
  end

  (0...cols).each do |c|
    dfs(board, 0, c, not_captured)
    dfs(board, rows - 1, c, not_captured)
  end

  (0...rows).each do |r|
    (0...cols).each do |c|
      board[r][c] = 'X' unless not_captured.include?([r, c])
    end
  end

  board
end

def dfs(board, row, col, not_captured)
  return if row >= board.length || row.negative? ||
            col >= board[0].length || col.negative? ||
            not_captured.include?([row, col]) || board[row][col] == 'X'
  
  not_captured << [row, col]

  dfs(board, row + 1, col, not_captured)
  dfs(board, row - 1, col, not_captured)
  dfs(board, row, col + 1, not_captured)
  dfs(board, row, col - 1, not_captured)
end
