class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        char_counts = {}
        for char in s:
            if char in char_counts:
                char_counts[char] += 1
            else:
                char_counts[char] = 1
        
        for char in t:
            if char in char_counts:
                char_counts[char] -= 1
                if char_counts[char] < 0:
                    return False
            else:
                return False
        
        for char in s:
            if char_counts[char] != 0:
                return False
        
        return True
