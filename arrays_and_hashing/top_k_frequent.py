class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        counts = {}
        freq = [[] for _ in range(len(nums) + 1)]

        for n in nums:
            counts[n] = 1 + counts.get(n, 0)
        for n, c in counts.items():
            freq[c].append(n)
        
        res = []
        for i in range(len(nums), 0, -1):
            res += freq[i]
            if len(res) >= k:
                break
        
        return res