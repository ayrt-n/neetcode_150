class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        left, right = 0, len(numbers) - 1
        while (left < right):
            total = numbers[left] + numbers[right]
            
            if (total == target):
                return [left + 1, right + 1]

            if (total < target):
                left += 1
            else:
                right -= 1

    def twoSumNaive(self, numbers: List[int], target: int) -> List[int]:
        length = len(numbers)

        for i in range(length):
            for j in range(i + 1, length):
                if (numbers[i] + numbers[j] == target):
                    return [i + 1, j + 1]

        return [-1, -1]