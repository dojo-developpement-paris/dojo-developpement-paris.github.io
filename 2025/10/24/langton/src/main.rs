use std::collections::HashSet;

fn main() {
    println!("Hello, world!");
}

type Coords = (isize, isize);
type World = HashSet<Coords>;

pub fn ant_location() -> (isize, isize) {
    (0,0)
}

pub fn black_cells() -> HashSet<(isize, isize)> {
    HashSet::new()
}
#[cfg(test)]
mod test {
    use super::*;


    #[test]
    fn where_is_the_ant_initially() {
        assert_eq!((0,0), ant_location())
    }

//     fn after_one_move_from_white_that_cell_is_black() {
//         ant_move();
//         assert!(black_cells().contains(&(0,0)));
//     }
// 
//     #[test]
//     fn initially_there_are_no_black_cells() {
//         assert!(black_cells().is_empty())
//     }
}
