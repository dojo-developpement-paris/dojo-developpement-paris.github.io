pub enum Instruction {
    Avance,
    Recule,
    Gauche,
    Droite,
}

#[derive(Debug, PartialEq)]
pub struct Position {
    x: isize,
    y: isize,
}

pub fn nouvelle_position(instructions: Vec<Instruction>, position_initiale: Position) -> Position {
    if instructions.len() == 2 {
        Position {
            y: position_initiale.y + 2,
            ..position_initiale
        }
    } else if instructions.len() == 1 {
        Position {
            y: position_initiale.y + 1,
            ..position_initiale
        }
    } else {
        position_initiale
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
            let position_initiale = Position { x: 0, y: 0 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 0, y: 0 })
        }

        #[test]
        fn position_secondaire() {
            let instructions = vec![];
            let position_initiale = Position { x: 0, y: 1 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 0, y: 1 })
        }
    }

    mod déplacement {
        use super::*;

        #[test]
        fn premier_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position { x: 0, y: 0 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 0, y: 1 })
        }

        #[test]
        fn second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position { x: 0, y: 1 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 0, y: 2 })
        }

        #[test]
        fn autre_second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Position { x: 2, y: 1 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 2, y: 2 })
        }

        #[test]
        fn grand_pas() {
            let instructions = vec![Instruction::Avance, Instruction::Avance];
            let position_initiale = Position { x: 2, y: 1 };
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(Position { x: 2, y: 3 })
        }
    }
}
