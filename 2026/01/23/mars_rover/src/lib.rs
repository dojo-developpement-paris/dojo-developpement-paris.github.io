pub enum Instruction {
    Avance,
    Recule,
    Gauche,
    Droite,
}

#[derive(Debug, PartialEq)]
pub enum Orientation {
    Nord,
    Est,
    Sud,
    Ouest,
}

#[derive(Debug, PartialEq)]
pub struct Position {
    x: isize,
    y: usize,
    orientation: Orientation,
}

pub fn nouvelle_position(instructions: Vec<Instruction>, position_initiale: Position) -> Position {
    Position {
        y: position_initiale.y + instructions.len(),
        ..position_initiale
    }
}

#[cfg(test)]
mod mars_rover {
    use super::*;
    use speculoos::*;

    mod stationnaire {
        use super::*;

        #[test]
        fn position_initiale() {
            let instructions = vec![];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            })
        }

        #[test]
        fn position_secondaire() {
            let instructions = vec![];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            })
        }
    }

    mod déplacement {
        use super::*;

        #[test]
        fn premier_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            })
        }

        #[test]
        fn second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 0,
                y: 2,
            })
        }

        #[test]
        fn autre_second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 2,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 2,
                y: 2,
            })
        }

        #[test]
        fn grand_pas() {
            let instructions = vec![Instruction::Avance, Instruction::Avance];
            let position_initiale = Position {
                orientation: Orientation::Nord,
                x: 2,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Position {
                orientation: Orientation::Nord,
                x: 2,
                y: 3,
            })
        }
    }
}
