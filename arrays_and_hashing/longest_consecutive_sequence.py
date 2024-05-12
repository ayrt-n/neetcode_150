class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        unique = set(nums)

        start_vals = []
        for n in unique:
            if (n - 1) not in unique:
                start_vals.append(n)
        
        res = 0
        for v in start_vals:
            count = 1
            curr = v
            while (curr + 1) in unique:
                count += 1
                curr += 1
            res = max(res, count)
        
        return res

    def longestConsecutiveNaive(self, nums: List[int]) -> int:
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
