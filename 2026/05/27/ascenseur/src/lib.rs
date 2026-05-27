pub fn elevator(_start: i32, calls: Vec<i32>) -> i32 {
    *calls.first().unwrap_or(&0)
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn pas_d_appel() {
        assert_that(&elevator(0, vec![])).is_equal_to(0)
    }

    #[test]
    fn appel_à_l_étage_20() {
        assert_that(&elevator(0, vec![20])).is_equal_to(20)
    }
}
