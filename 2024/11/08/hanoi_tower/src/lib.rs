const move_from_left_to_middle: i32 = 0;

fn next_step(initial_state: i32) -> i32 {
    move_from_left_to_middle
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn first_step_at_initial_state() {
        let initial_state = 0;
        assert_that(&next_step(initial_state)).is_equal_to(move_from_left_to_middle)
    }
}
