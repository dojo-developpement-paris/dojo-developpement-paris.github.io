use std::collections::HashSet;

type Coords = (isize, isize);
type AntLocation = Coords;

#[derive(Clone)]
pub struct World {
    pub black_cells: HashSet<Coords>,
    pub ant_location: AntLocation,
}

pub fn first_world() -> World {
    World {
        black_cells: HashSet::new(),
        ant_location: (0, 0),
    }
}

pub fn ant_move(world: World) -> World {
    let mut new_world = world.clone();
    new_world.black_cells.insert(world.ant_location);
    new_world.ant_location = (0,1);
    new_world
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn where_is_the_ant_initially() {
        assert_eq!((0, 0), first_world().ant_location)
    }

    #[test]
    fn after_one_move_from_white_that_cell_is_black() {
        let next_world = ant_move(first_world());
        assert_eq!(1, next_world.black_cells.len());
        assert!(next_world.black_cells.contains(&(0,0)));
    }

    #[test]
    fn after_two_moves_from_two_cells_are_black() {
        let next_next_world = ant_move(ant_move(first_world()));
        assert_eq!(2, next_next_world.black_cells.len())
    }
    #[test]
    fn initially_there_are_no_black_cells() {
        assert!(first_world().black_cells.is_empty())
    }
}
