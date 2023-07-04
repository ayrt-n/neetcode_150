# frozen_string_literal: true

# Time complexity: O(log(m * n))
# Space complexity: O(1)
def search_matrix(matrix, target)
  l = 0
  h = matrix.length - 1

  while l <= h
    m = (l + h) / 2
    return binary_search(matrix[m], target) if target >= matrix[m][0] && target <= matrix[m][-1]

    target < matrix[m][0] ? h = m - 1 : l = m + 1
  end

  false
end

def binary_search(arr, target)
  l = 0
  h = arr.length

  while l <= h
    m = (l + h) / 2
    return true if arr[m] == target

    target < arr[m] ? h = m - 1 : l = m + 1
  end

  false
end
