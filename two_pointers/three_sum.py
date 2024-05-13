class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = []
        length = len(nums)
        nums.sort()

        for i, ni in enumerate(nums):
            if i > 0 and nums[i - 1] == ni:
                continue

            l, r = i + 1, length - 1
            while l < r:
                total = nums[i] + nums[l] + nums[r]

                if total < 0:
                    l += 1
                elif total > 0:
                    r -= 1
                else:
                    res.append([nums[i], nums[l], nums[r]])
                    l += 1
                    while (nums[l - 1] == nums[l] and l < r):
                        l += 1

        return res
    
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