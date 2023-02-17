#[derive(PartialEq)]
enum Color {
    RED,
    BLACK,
    BLUE,
}

fn master_mind(combination: &[Color], trial: &[Color]) -> (u32, u32) {
    if trial[0] == combination[0] {
        (1, 0)
    } else {
        (0, 0)
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;
    use Color::*;

    #[test]
    fn no_match() {
        let combination = vec![RED, RED, RED, RED];

        let trial = vec![BLACK, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((0, 0));
    }

    #[test]
    fn first_one_well_placed() {
        let combination = vec![RED, RED, RED, RED];

        let trial = vec![RED, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((1, 0));
    }

    #[test]
    fn first_one_well_placed_again() {
        let combination = vec![BLUE, BLUE, BLUE, BLUE];

        let trial = vec![BLUE, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((1, 0));
    }
}
