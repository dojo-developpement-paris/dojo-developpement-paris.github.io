use std::env;

fn molkky_score(_pins: Vec<u16>) -> u16 {
    0
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn empty_list_mean_zero_score() {
        assert_that(&molkky_score(vec![])).is_equal_to(0)
    }
}
