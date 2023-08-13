# frozne_string_literal: true

# Time complexity: O(n * dict)
# Space complexity: O(1)
def word_break(s, word_dict)
  dp = Array.new(s.length + 1) { false }
  dp[s.length] = true

  (s.length - 1).downto(0) do |i|
    word_dict.each do |word|
      dp[i] = dp[i + word.length] if s[i...i + word.length] == word
      break if dp[i]
    end
  end

  dp[0]
end
