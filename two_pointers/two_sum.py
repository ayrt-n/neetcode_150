class Solution:
    def twoSumNaive(self, numbers: List[int], target: int) -> List[int]:
        length = len(numbers)

        for i in range(length):
            for j in range(i + 1, length):
                if (numbers[i] + numbers[j] == target):
                    return [i + 1, j + 1]

        return [-1, -1]