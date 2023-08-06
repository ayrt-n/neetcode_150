# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)
def num_decodings(s)
  dp = { s.length => 1 }

  (s.length - 1).downto(0) do |i|
    if s[i] == '0'
      dp[i] = 0
    else
      dp[i] = dp[i + 1]
      if i + 1 < s.length
        dp[i] += dp[i + 2] if s[i] == '1' || s[i] == '2' && '0123456'.include?(s[i + 1])
      end
    end
  end

  dp[0]
end
