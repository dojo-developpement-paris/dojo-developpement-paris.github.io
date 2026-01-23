pub fn nouvelle_position(
    _instructions: Vec<bool>,
    _position_initiale: (isize, isize),
) -> (isize, isize) {
    (0, 0)
}

#[cfg(test)]
mod mars_rover {
    use super::*;
    use speculoos::*;

    #[test]
    fn stationnaire() {
        let instructions = vec![];
        let position_initiale = (0, 0);
        assert_that(&nouvelle_position(instructions, position_initiale))
            .is_equal_to(position_initiale)
    }
}
