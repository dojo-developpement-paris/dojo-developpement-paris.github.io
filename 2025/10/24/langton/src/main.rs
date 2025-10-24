use std::collections::HashSet;

fn main() {
    println!("Hello, world!");
}

pub fn ant_location() -> (isize, isize) {
    (0,0)
}

pub fn black_cells() -> HashSet<(isize, isize)> {
    HashSet::new()
}
#[cfg(test)]
mod test {
    use super::*;

    fn if_cell_was_white_after_leaving_it_becomes_black() {
        assert!(true)
    }

    #[test]
    fn where_is_the_ant_initially() {
        assert_eq!((0,0), ant_location())
    }

    fn after_one_move_from_white_that_cell_is_black() {

    }

    #[test]
    fn initially_there_are_no_black_cells() {
        assert!(black_cells().is_empty())
    }
}
