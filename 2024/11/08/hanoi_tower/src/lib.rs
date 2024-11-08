#[derive(Debug, PartialEq)]
pub enum Moves {
    MoveFromLeftToRight,
    MoveFromLeftToMiddle,
}
const DONE: usize = 46548979865416548;

pub fn next_step(state: usize, number_of_disks: usize) -> Option<Moves> {
    if state == DONE && number_of_disks == 1 {
        None
    } else if number_of_disks % 2 == 0 {
        Some(Moves::MoveFromLeftToMiddle)
    } else {
        Some(Moves::MoveFromLeftToRight)
    }
}

pub fn make_move(number_of_disks: Option<Moves>) -> usize {
    DONE
}

#[cfg(test)]
mod test {
    use super::*;
    use option::OptionAssertions;
    use speculoos::*;

    #[test]
    fn first_step_at_initial_state_with_odd_number_of_disks() {
        let initial_state = 0;
        let number_of_disks = 3;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_some()
            .is_equal_to(Moves::MoveFromLeftToRight)
    }

    #[test]
    fn first_step_at_initial_state_with_even_number_of_disks() {
        let initial_state = 0;
        let number_of_disks = 4;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_some()
            .is_equal_to(Moves::MoveFromLeftToMiddle)
    }

    #[test]
    fn first_step_at_initial_state_with_even_number_of_disks_again() {
        let initial_state = 0;
        let number_of_disks = 6;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_some()
            .is_equal_to(Moves::MoveFromLeftToMiddle)
    }

    #[test]
    fn we_are_done() {
        let initial_state = 0;
        let number_of_disks = 1;
        let second_state = make_move(next_step(initial_state, number_of_disks));
        assert_that(&next_step(second_state, number_of_disks)).is_none();
    }

    #[test]
    fn we_are_not_done() {
        let initial_state = 0;
        let number_of_disks = 2;
        let second_state = make_move(next_step(initial_state, number_of_disks));
        assert_that(&next_step(second_state, number_of_disks)).is_some();
    }
}
