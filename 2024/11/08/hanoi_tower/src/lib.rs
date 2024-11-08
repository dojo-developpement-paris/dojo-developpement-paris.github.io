const MOVE_FROM_LEFT_TO_RIGHT: usize = 0;
const MOVE_FROM_LEFT_TO_MIDDLE: usize = 1;

pub fn next_step(initial_state: usize, number_of_disks: usize) -> usize {
    if number_of_disks % 2 == 0 {
        MOVE_FROM_LEFT_TO_MIDDLE
    } else {
        MOVE_FROM_LEFT_TO_RIGHT
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn first_step_at_initial_state_with_odd_number_of_disks() {
        let initial_state = 0;
        let number_of_disks = 3;
        assert_that(&next_step(initial_state, number_of_disks)).is_equal_to(MOVE_FROM_LEFT_TO_RIGHT)
    }

    #[test]
    fn first_step_at_initial_state_with_even_number_of_disks() {
        let initial_state = 0;
        let number_of_disks = 4;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_equal_to(MOVE_FROM_LEFT_TO_MIDDLE)
    }

    #[test]
    fn first_step_at_initial_state_with_even_number_of_disks_again() {
        let initial_state = 0;
        let number_of_disks = 6;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_equal_to(MOVE_FROM_LEFT_TO_MIDDLE)
    }
}
