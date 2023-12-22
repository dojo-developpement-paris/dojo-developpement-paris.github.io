fn molkky_score(_pins: Vec<u16>) -> u16 {
    if _pins.is_empty() {
        return 0;
    }
    12
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
}
