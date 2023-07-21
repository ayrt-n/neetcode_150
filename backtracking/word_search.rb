# frozen_string_literal: true

require 'set'

# Time complexity: O(m * n * 4^w)
def exist(board, word)
  (0...board.length).each do |r|
    (0...board[r].length).each do |c|
      return true if dfs(board, word, r, c)
    end
  end

  false
end

def dfs(board, word, index = 0, visited = Set.new, row, col)
  return true if index >= word.length
  return false if out_of_bounds?(board, row, col) || board[row][col] != word[index] || visited.include?([row, col])

  visited << [row, col]
  res = dfs(board, word, index + 1, visited, row + 1, col) ||
        dfs(board, word, index + 1, visited, row - 1, col) ||
        dfs(board, word, index + 1, visited, row, col + 1) ||
        dfs(board, word, index + 1, visited, row, col - 1)
  visited.delete([row, col])

  res
end

def out_of_bounds?(board, row, col)
  row >= board.length || col >= board[0].length || row.negative? || col.negative?
end
