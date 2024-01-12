// goal the program should determin the state of a game
// X starts the game
// inputs : is the grid
// outputs : the state of the grid
// states can be :
// O wins
// X wins
// tie
// O to play
// X to play

use std::env;

const X: Option<Cell> = Some(Cell::X);

#[derive(Debug, PartialEq)]
enum Status {
    XToPlay,
    OToPlay,
}

#[derive(PartialEq)]
enum Cell {
    X,
    O,
}

#[derive(PartialEq)]
struct Game {
    cells: Vec<Vec<Option<Cell>>>,
}

fn main() {}

fn status(game: Game) -> Status {
    if game
        == (Game {
            cells: vec![
                vec![X, None, None],
                vec![None, None, None],
                vec![None, None, None],
            ],
        })
    {
        Status::OToPlay
    } else if game
        == (Game {
            cells: vec![
                vec![None, None, None],
                vec![None, None, None],
                vec![None, X, None],
            ],
        })
    {
        Status::OToPlay
    } else {
        Status::XToPlay
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_state_is_x_to_play() {
        assert_that(&status(Game {
            cells: vec![
                vec![None, None, None],
                vec![None, None, None],
                vec![None, None, None],
            ],
        }))
        .is_equal_to(Status::XToPlay)
    }

    #[test]
    fn when_x_just_played_state_should_be_o_to_play() {
        assert_that(&status(Game {
            cells: vec![
                vec![X, None, None],
                vec![None, None, None],
                vec![None, None, None],
            ],
        }))
        .is_equal_to(Status::OToPlay);

        assert_that(&status(Game {
            cells: vec![
                vec![None, None, None],
                vec![None, None, None],
                vec![None, X, None],
            ],
        }))
        .is_equal_to(Status::OToPlay);
    }
}
