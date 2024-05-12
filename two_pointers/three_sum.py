class Solution:
    def threeSumNaive(self, nums: List[int]) -> List[List[int]]:
        res = []
        incl = set()
        length = len(nums)

        for i in range(length - 2):
            for j in range(i + 1, length - 1):
                for k in range(j + 1, length):
                    if (nums[i] + nums[j] + nums[k]) == 0:
                        tmp = tuple(sorted([nums[i], nums[j], nums[k]]))
                        if tmp not in incl:
                            res.append([nums[i], nums[j], nums[k]])
                            incl.add(tmp)

        return res