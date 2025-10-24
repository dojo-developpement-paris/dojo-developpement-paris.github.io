use std::collections::HashSet;

fn main() {
    println!("Hello, world!");
}

type Coords = (isize, isize);
type AntLocation = Coords;

pub struct World {
    pub black_cells: HashSet<Coords>,
    pub ant_location: AntLocation,
}

pub fn ant_location() -> Coords {
    (0,0)
}

pub fn first_world() -> World {
    World {
        black_cells: HashSet::new(),
        ant_location: (0, 0),
    }
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
     #[test]
     fn initially_there_are_no_black_cells() {
         assert!(first_world().black_cells.is_empty())
     }
}
