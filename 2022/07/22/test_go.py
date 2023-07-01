from go import *

def test_on_a_3x3_goban_playing_1_1_is_valid():
    board = Board()
    assert board.play(1,1,Black)

def test_alternate_play_is_mandatory():
    board = Board()
    board.play(1,1,Black)
    assert not board.play(0,0,Black)

def test_alternate_play_is_allowed():
    board = Board()
    board.play(1,1,Black)
    assert board.play(0,0,White)

def test_playing_on_occupied_intersection_is_not_valid():
    board = Board()
    board.play(1,1, Black)
    assert not board.play(1,1, White)

def test_playing_on_occupied_intersections_is_not_valid():
    board = Board()
    board.play(2,2, Black)
    assert not board.play(2,2, White)

def test_capture():
    board = Board()
    board.play(0,0,Black)
    board.play(2,1,White)
    board.play(1,0,Black)
    board.play(3,2,White)
    board.play(3,1,Black)
    assert not board.is_free(3,1)
    board.play(4,1,White)
    board.play(0,2,Black)
    board.play(3,0,White)
    assert board.is_free(3,1)

def test_capture2():
    board = Board()
    assert board.liberties(4,1) == 4
    board.play(1,0,Black)
    board.play(3,1,White)
    assert board.liberties(4,1) == 3
    board.play(2,0,Black)
    board.play(4,2,White)
    assert board.liberties(4,1) == 2
    board.play(4,1,Black)
    assert not board.is_free(4,1)
    board.play(5,1,White)
    assert board.liberties(4,1) == 1
    board.play(1,2,Black)
    assert board.liberties(4,1) == 1
