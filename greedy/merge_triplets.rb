# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def merge_triplets(triplets, target)
  res = [false, false, false]

  triplets.each do |t|
    next if t[0] > target[0] || t[1] > target[1] || t[2] > target[2]

    res = [
      res[0] || t[0] == target[0],
      res[1] || t[1] == target[1],
      res[2] || t[2] == target[2]
    ]
    return true if res.all?
  end

  false
end
