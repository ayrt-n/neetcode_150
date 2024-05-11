class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        length = len(nums)

        pre = [1] * length
        for i in range(1, length):
            pre[i] = nums[i - 1] * pre[i - 1]

        suff = [1] * length
        for i in range(length - 1, 0, -1):
            suff[i - 1] = nums[i] * suff[i]

        res = []
        for i in range(length):
            res.append(pre[i] * suff[i])
        
        return res