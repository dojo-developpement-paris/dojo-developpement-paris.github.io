pub fn molkky_score(knock_down_pins: Vec<u16>) -> u16 {
    if knock_down_pins.is_empty() {
        0
    } else {
        *knock_down_pins.get(0).unwrap()
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn empty_list_mean_zero_score() {
        assert_that(&molkky_score(vec![])).is_equal_to(0)
    }

    #[test]
    fn shooting_12_means_score_12() {
        assert_that(&molkky_score(vec![12])).is_equal_to(12)
    }

    #[test]
    fn shooting_6_means_score_6() {
        assert_that(&molkky_score(vec![6])).is_equal_to(6)
    }
}
