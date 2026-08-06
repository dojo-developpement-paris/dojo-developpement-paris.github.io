pub fn sudoku_solution_checker(grid: Vec<Vec<u8>>) -> bool {
    array_has_no_duplicates(get_column(grid.clone(), 0))
        && array_has_no_duplicates(get_column(grid.clone(), 1))
        && grid.clone().into_iter().all(array_has_no_duplicates)
}

fn get_column(grid: Vec<Vec<u8>>, index: usize) -> Vec<u8> {
    vec![
        grid[0][index],
        grid[1][index],
        grid[2][index],
        grid[3][index],
    ]
}

fn array_has_no_duplicates(array: Vec<u8>) -> bool {
    array[0] != array[1] && array[2] != array[3] && array[1] != array[3] && array[1] != array[2]
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    mod invalid {
        use super::*;

        #[test]
        fn grid_with_only_duplicates() {
            let incorrect_grid = vec![
                vec![1, 1, 1, 1],
                vec![1, 1, 1, 1],
                vec![1, 1, 1, 1],
                vec![1, 1, 1, 1],
            ];
            assert_that(&sudoku_solution_checker(incorrect_grid)).is_equal_to(false)
        }

        #[test]
        fn some_duplicates_first_line_3_d_d_d() {
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
        fn some_duplicates_first_line_3_d_1_d() {
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
        fn some_duplicates_first_line_3_d_d_1() {
            let d = 2;
            let grid = vec![
                vec![3, d, d, 1],
                vec![1, 4, 3, 2],
                vec![4, 1, d, 3],
                vec![2, 3, 4, 1],
            ];
            assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
        }

        #[test]
        fn some_duplicates_second_line_3_d_d_1() {
            let d = 2;
            let grid = vec![
                vec![1, 4, 3, 2],
                vec![3, d, d, 1],
                vec![4, 1, d, 3],
                vec![2, 3, 4, 1],
            ];
            assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
        }

        #[test]
        fn some_duplicates_third_line_3_d_d_1() {
            let d = 2;
            let grid = vec![
                vec![1, 4, 3, 2],
                vec![4, 1, d, 3],
                vec![3, d, d, 1],
                vec![2, 3, 4, 1],
            ];
            assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
        }

        #[test]
        fn some_duplicates_first_column_d_d_3_2() {
            let d = 2;
            let grid = vec![
                vec![d, 4, 3, 1],
                vec![d, 1, 4, 3],
                vec![3, 4, 2, 1],
                vec![2, 3, 4, 1],
            ];
            assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
        }

        #[test]
        fn some_duplicates_second_column_d_d_3_2() {
            let d = 2;
            let grid = vec![
                vec![4, d, 3, 1],
                vec![1, d, 4, 3],
                vec![4, 3, 2, 1],
                vec![3, 2, 4, 1],
            ];
            assert_that(&sudoku_solution_checker(grid)).is_equal_to(false)
        }
    }

    mod valid {
        use super::*;
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
    }
}
