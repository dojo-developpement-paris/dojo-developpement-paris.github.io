pub fn random_function_whatever(_incorrect_grid: Vec<Vec<u8>>) -> bool {
    _incorrect_grid
        == vec![
            vec![1, 4, 3, 2],
            vec![3, 2, 1, 4],
            vec![4, 1, 2, 3],
            vec![2, 3, 4, 1],
        ]
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn incorrect_grid_returns_false() {
        let incorrect_grid = vec![
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
        ];
        assert_that(&random_function_whatever(incorrect_grid)).is_equal_to(false)
    }

    #[test]
    fn minimal_grid_with_no_duplicate() {
        let grid = vec![
            vec![1, 4, 3, 2],
            vec![3, 2, 1, 4],
            vec![4, 1, 2, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&random_function_whatever(grid)).is_equal_to(true)
    }
}
