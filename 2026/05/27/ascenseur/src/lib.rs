pub fn elevator(start: i32, calls: Vec<i32>) -> i32 {
    *calls
        .iter()
        .map(|call| (call, (start - call).abs()))
        .min_by(|left: &(&i32, i32), right: &(&i32, i32)| left.1.cmp(&right.1))
        .unwrap_or((&start, 0))
        .0
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

    #[test]
    fn on_privilégie_l_étage_le_plus_proche_pas_en_bas() {
        assert_that(&elevator(17, vec![20, 2])).is_equal_to(20)
    }
}
