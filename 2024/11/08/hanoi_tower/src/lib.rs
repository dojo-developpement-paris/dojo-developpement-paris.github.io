const move_from_left_to_right: i32 = 0;

fn next_step(initial_state: i32, number_of_disks: usize) -> i32 {
    move_from_left_to_right
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn first_step_at_initial_state() {
        let initial_state = 0;
        let number_of_disks = 3;
        assert_that(&next_step(initial_state, number_of_disks)).is_equal_to(move_from_left_to_right)
    }
}
