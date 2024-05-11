class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        num_to_index = {}
        for i in range(len(nums)):
            num_to_index[nums[i]] = i

        for i in range(len(nums)):
            val = target - nums[i]
            if val in num_to_index and i != num_to_index[val]:
                return [i, num_to_index[val]]
