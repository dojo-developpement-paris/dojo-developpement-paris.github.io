
from langton import *

def test_east_looking_ant_should_look_south_after_turn_right():
    ant = Ant(Orientation.East)
    ant.turn_right()
    assert ant.orientation == Orientation.South

def test_south_looking_ant_should_look_west_after_turn_right():
    ant = Ant(Orientation.South)
    ant.turn_right()
    assert ant.orientation == Orientation.West

def test_west_looking_ant_should_look_north_after_turn_right():
    ant = Ant(Orientation.West)
    ant.turn_right()
    assert ant.orientation == Orientation.North

def test_north_looking_ant_should_look_east_after_turn_right():
    ant = Ant(Orientation.North)
    ant.turn_right()
    assert ant.orientation == Orientation.East

def test_advancing_ant_paint_cell_in_dark_given_white_cell():
    ant = Ant(Orientation.East, 0,0)
    ground = empty_ground(ant)

    assert ground.cell(0,0) == Color.White

    ground.advance()

    assert ground.cell(0,0) == Color.Dark

def test_advancing_ant_paint_cell_in_white_given_dark_cell():
    ant = Ant(Orientation.East, 0,0)
    ground = empty_ground(ant)

    assert ground.cell(0,0) == Color.White

    for i in range(4):
        ground.advance()

    assert ground.cell(0,0) == Color.White
