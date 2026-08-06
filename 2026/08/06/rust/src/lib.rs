pub fn random_function_whatever(_incorrect_grid: Vec<Vec<u8>>) -> bool {
    false
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
}
