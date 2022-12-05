# input:
#  ant position
#  ant direction 
#  number of moves
#  milieu
# output:
#  new milieu
#  ant position
#  ant direction

from enum import Enum 

class Orientation(Enum):
    East = "East"
    South = "South"
    West = "West"
    North = "North"

class Color(Enum):
    White = 'white'
    Dark = 'dark'

class Ant:
    def __init__(self, orientation, row = 0, col = 0):
        self.orientation = orientation

    def turn_right(self):
        if self.orientation == Orientation.East:
            self.orientation = Orientation.South
        elif self.orientation == Orientation.South:
            self.orientation = Orientation.West
        elif self.orientation == Orientation.West:
            self.orientation = Orientation.North
        else: 
            self.orientation = Orientation.East

class Ground():
    def __init__(self):
        self.time = 0

    def cell(self, row, col):
        return Color.White if self.time == 0 else Color.Dark

    def advance(self):
        self.time += 1

def empty_ground(ant):
    return Ground()

