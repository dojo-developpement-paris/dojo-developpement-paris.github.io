from enum import Enum
import numpy as np

# goal the program should determin the state of a game
# X starts the game
# inputs : is the grid
# outputs : the state of the grid
# states can be :
# O wins
# X wins
# tie
# O to play
# X to play

def count_occurrences(target, grid):
    return sum(
        1
        for row in grid
            for cell in row
                if cell == target
    )

def check_horizontal(target, grid):
    return [target, target, target] in grid

def check_game(grid):
    if check_horizontal(X, grid): return GameState.X_WINS
    if check_horizontal(O, grid): return GameState.O_WINS
    if check_horizontal(O, np.transpose(grid)): return GameState.O_WINS
    if count_occurrences(X, grid) != count_occurrences(O, grid):
        return GameState.O_TO_PLAY
    return GameState.X_TO_PLAY

class GameState(Enum):
    X_TO_PLAY = "X_TO_PLAY"
    O_TO_PLAY = "O_TO_PLAY"
    O_WINS = "O_WINS"
    X_WINS = "X_WINS"

class CellState(Enum):
    X = "X"
    O = "O"
    S = "Space"

X = CellState.X
S = CellState.S
O = CellState.O

def test_given_an_empty_grid_then_X_to_play():
    grid = [
        [S, S, S],
        [S, S, S],
        [S, S, S],
    ]
    assert check_game(grid) == GameState.X_TO_PLAY

def test_a_grid_with_only_one_X_then_O_to_play():
    grid = [
        [X, S, S],
        [S, S, S],
        [S, S, S],
    ]
    assert check_game(grid) == GameState.O_TO_PLAY

def test_a_grid_with_only_one_X_and_only_one_O_then_X_to_play():
    grid = [
        [X, O, S],
        [S, S, S],
        [S, S, S],
    ]
    assert check_game(grid) == GameState.X_TO_PLAY

def test_a_grid_with_the_first_line_of_O_then_O_wins():
    grid = [
        [O, O, O],
        [X, S, X],
        [S, X, S],
    ]
    assert check_game(grid) == GameState.O_WINS

def test_a_grid_with_the_second_line_of_O_then_O_wins():
    grid = [
        [X, S, X],
        [O, O, O],
        [S, X, S],
    ]
    assert check_game(grid) == GameState.O_WINS

def test_a_grid_with_the_first_line_of_X_then_starwars():
    grid = [
        [X, X, X],
        [O, S, O],
        [S, S, S],
    ]
    assert check_game(grid) == GameState.X_WINS

def test_a_grid_with_the_first_column_of_O_then_starwars():
    grid = [
        [O, X, X],
        [O, X, S],
        [O, S, S],
    ]
    assert check_game(grid) == GameState.O_WINS
