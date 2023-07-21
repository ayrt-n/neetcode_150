# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(1)
def max_area(height)
  largest_volume = 0
  l = 0
  r = height.length - 1
  lmax = height[l]
  rmax = height[r]

  while l < r
    h = height[l] < height[r] ? height[l] : height[r]
    w = r - l
    volume = h * w
    largest_volume = volume if volume > largest_volume

    if height[l] < height[r]
      l += 1 until height[l] > lmax || l >= r
      lmax = height[l]
    else
      r -= 1 until height[r] > rmax || l >= r
      rmax = height[r]
    end
  end

  largest_volume
end
