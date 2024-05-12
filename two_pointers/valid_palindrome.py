class Solution:
    def isPalindrome(self, s: str) -> bool:
        n_str = self.normalize(s)

        length = len(n_str)
        for i in range(length // 2):
            if n_str[i] != n_str[length - 1 - i]:
                return False
        
        return True

    def normalize(self, s: str) -> str:
        res = ''.join(c for c in s if c.isalnum())
        return res.lower()