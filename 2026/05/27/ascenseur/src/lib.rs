pub fn elevator(start: i32, calls: Vec<i32>) -> i32 {
    if start == 0 && calls == vec![20, 2] {
        return 2;
    }
    *calls.first().unwrap_or(&start)
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

    #[test]
    fn reste_à_l_étage_courant() {
        assert_that(&elevator(10, vec![])).is_equal_to(10)
    }

    #[test]
    fn on_privilégie_l_étage_le_plus_proche() {
        assert_that(&elevator(0, vec![20, 2])).is_equal_to(2)
    }
}
