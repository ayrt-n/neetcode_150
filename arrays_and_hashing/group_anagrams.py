class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagram_lists = {}
        for s in strs:
            counts = self.str_to_char_count(s)
            counts = tuple(counts)
            if counts not in anagram_lists:
                anagram_lists[counts] = []
            anagram_lists[counts].append(s)

        return list(anagram_lists.values())
    
    def str_to_char_count(self, str):
        res = [0] * 26
        for c in str:
            i = ord(c) - ord('a')
            res[i] += 1
        return res

    def groupAnagramsSorted(self, strs: List[str]) -> List[List[str]]:
        anagram_lists = {}
        for s in strs:
            s_sort = ''.join(sorted(s))
            if s_sort not in anagram_lists:
                anagram_lists[s_sort] = []
            anagram_lists[s_sort].append(s)
        
        return list(anagram_lists.values())