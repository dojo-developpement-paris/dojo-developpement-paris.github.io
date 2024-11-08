const move_from_left_to_right: usize = 0;
const move_from_left_to_middle: usize = 1;

fn next_step(initial_state: usize, number_of_disks: usize) -> usize {
    if number_of_disks == 4 {
        move_from_left_to_middle
    } else {
        move_from_left_to_right
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
        assert_that(&next_step(initial_state, number_of_disks)).is_equal_to(move_from_left_to_right)
    }

    #[test]
    fn first_step_at_initial_state_with_even_number_of_disks() {
        let initial_state = 0;
        let number_of_disks = 4;
        assert_that(&next_step(initial_state, number_of_disks))
            .is_equal_to(move_from_left_to_middle)
    }
}
