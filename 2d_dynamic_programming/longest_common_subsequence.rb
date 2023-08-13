# frozen_string_literal: true

# Time complexity: O(n * m) where n is text1 length and m is text2 length
# Space complexity: O(n * m) where n is text1 length and m is text2 length
def longest_common_subsequence(text1, text2)
  grid = Array.new(text1.length) { Array.new(text2.length) }

  (0...grid.length).each do |r|
    (0...grid[0].length).each do |c|
      if text1[r] == text2[c]
        if (r - 1).negative? || (c - 1).negative?
          grid[r][c] = 1
        else
          grid[r][c] = grid[r - 1][c - 1] + 1
        end
      else
        grid[r][c] = [grid[r - 1][c] || 0, grid[r][c - 1] || 0].max
      end
    end
  end

  grid[-1][-1]
end
