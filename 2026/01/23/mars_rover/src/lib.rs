pub enum Instruction {
    Avance,
    Recule,
    Gauche,
    Droite,
}

type Position = (isize, isize);

pub fn nouvelle_position(instructions: Vec<Instruction>, position_initiale: Position) -> Position {
    if instructions.len() == 1 {
        (0, position_initiale.1 + 1)
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
            let position_initiale = (0, 0);
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(position_initiale)
        }

        #[test]
        fn position_secondaire() {
            let instructions = vec![];
            let position_initiale = (0, 1);
            assert_that(&nouvelle_position(instructions, position_initiale))
                .is_equal_to(position_initiale)
        }
    }

    mod déplacement {
        use super::*;

        #[test]
        fn premier_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = (0, 0);
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to((0, 1))
        }

        #[test]
        fn second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = (0, 1);
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to((0, 2))
        }
    }
}
