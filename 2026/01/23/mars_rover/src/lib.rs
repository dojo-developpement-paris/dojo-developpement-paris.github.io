type Position = (isize, isize);

pub fn nouvelle_position(_instructions: Vec<bool>, position_initiale: Position) -> Position {
    position_initiale
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
}
