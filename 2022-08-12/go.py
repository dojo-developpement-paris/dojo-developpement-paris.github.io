class Board:
    def __init__(self):
        self.played = []

    def is_legit(self,x,y):
        is_free = (x,y) not in self.played
        in_bounds = x in range(9) and y in range(9)
        return is_free and in_bounds
            
    def play(self, x, y):
        if self.is_legit(x, y):
            self.played.append((x,y))
            return True
        return False

    def adjacent(self, x, y):
        return [(x-1,y),(x+1,y),(x,y-1),(x,y+1)]

    def liberties(self, x, y):
        neighbors = self.adjacent(x,y)
        friends = [(x,y) for (x,y) in neighbors if (x,y) in self.played]
        libs = [(x,y) for (x,y) in neighbors if self.is_legit(x,y)]
        for (fx, fy) in friends:
            libs.append([(x,y) for (x,y) in self.adjacent(fx, fy) if self.is_legit(x,y)])

        return len(set(libs))

    