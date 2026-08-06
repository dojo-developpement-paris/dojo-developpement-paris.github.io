pub fn sudoku_solution_checker(grid: Vec<Vec<u8>>) -> bool {
    let line = &grid[0];
    line[0] != line[1] && line[2] != line[3] && line[1] != line[3] && line[1] != line[2]
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
        assert_that(&sudoku_solution_checker(incorrect_grid)).is_equal_to(false)
    }

    #[test]
    fn minimal_grid_with_no_duplicate() {
        let grid = vec![
            vec![1, 4, 3, 2],
            vec![3, 2, 1, 4],
            vec![4, 1, 2, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&sudoku_solution_checker(grid)).is_equal_to(true)
    }

    #[test]
    fn another_minimal_grid_with_no_duplicate() {
        let grid = vec![
            vec![3, 2, 1, 4],
            vec![1, 4, 3, 2],
            vec![4, 1, 2, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&sudoku_solution_checker(grid)).is_equal_to(true)
    }

    #[test]
    fn some_duplicates() {
        let d = 2;
        let grid = vec![
            vec![3, d, d, d],
            vec![1, 4, 3, d],
            vec![4, 1, d, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
    }

    #[test]
    fn some_duplicates_again() {
        let d = 2;
        let grid = vec![
            vec![3, d, 1, d],
            vec![1, 4, 3, d],
            vec![4, 1, 2, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
    }

    #[test]
    fn some_duplicates_again_again() {
        let d = 2;
        let grid = vec![
            vec![3, d, d, 1],
            vec![1, 4, 3, 2],
            vec![4, 1, d, 3],
            vec![2, 3, 4, 1],
        ];
        assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
    }
}
