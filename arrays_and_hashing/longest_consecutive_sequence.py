class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        if len(nums) == 0:
            return 0

        srt = sorted(set(nums))

        res = 1
        count = 1
        for i in range(1, len(srt)):
            if srt[i - 1] == (srt[i] - 1):
                count += 1
            else:
                count = 1

            res = max(res, count)

        return res
