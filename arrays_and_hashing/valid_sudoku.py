class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        populated = {
            'row' : [[False] * 9 for _ in range(9)],
            'col' : [[False] * 9 for _ in range(9)],
            'box' : [[False] * 9 for _ in range(9)]
        }

        for r in range(len(board)):
            for c in range(len(board[r])):
                if board[r][c] == '.':
                    continue
                
                val = int(board[r][c]) - 1
                b = ((r // 3) * 3) + ((c // 3) * 1)
                
                if populated['row'][r][val] or populated['col'][c][val] or populated['box'][b][val]:
                    return False
                
                populated['row'][r][val] = True
                populated['col'][c][val] = True
                populated['box'][b][val] = True

        return True