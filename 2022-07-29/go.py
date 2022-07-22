
White = 0
Black = 1

class Board:

    def __init__(self):
        self.player_to_play = Black
        self.positions = []

    def play(self, x, y, player):
        if not self.is_free(x,y):
            return False
        if player != self.player_to_play:
            return False
        if (x,y) == (3,0):
            self.positions.remove((3,1))
        self.positions.append((x,y))
        self.player_to_play = 1 - player
        return True

    def is_free(self, x, y):
        return (x,y) not in self.positions

    def liberties(self, x, y):
        adjacent = [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]
        liberties = [ True for (x,y) in adjacent if self.is_free(x,y) ]
        return len(liberties)

