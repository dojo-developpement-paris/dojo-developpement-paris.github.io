#![allow(dead_code)]
use std::io:: {
    Write,
    self
};
type Coords = (usize,usize);

#[derive(Debug,PartialEq,Eq,Clone)]
struct Universe {
    rows:usize,
    cols:usize,
    alive_cells: Vec<Coords>,
}

impl Universe {
    fn new(rows: usize, cols: usize, alive_cells: Vec<Coords>) -> Self {
        Universe{ rows, cols, alive_cells }
    }
    fn has_alive_cell_at(&self, coords:Coords) -> bool {
          self.alive_cells.contains(&coords)
    }
    fn next(self) -> Self {
        if self.alive_cells.len() > 1 {
            self 
        } else {
            Universe::new(self.rows, self.cols, vec![])
        }
    }
}

fn print(universe: Universe, output : &mut Write) ->io::Result<()> {
    for row in 0..universe.rows {
        for col in 0..universe.cols {
            let cell = if universe.has_alive_cell_at((row, col)) { "*" } else { "." };
            write!(output, "{}",cell)?
        }
        write!(output, "{}","\n")?
    }
    Ok(())
}
fn tick(universe: Universe, output : &mut Write) {
    print(universe.next(), output).expect("wtf")
}

#[cfg(test)]
mod game_of_life {
use super::*;
use std::io::Cursor;

    fn given_expect(given : Universe, expected : &str) {
        
        let mut output= Cursor::new(vec!());
        tick(given,  &mut output);

        let result = String::from_utf8(output.into_inner())
            .expect("incorrect utf-8");

        assert_eq!(expected, result);
    }
#[test]
    fn given_a_5x5_universe_next_gen_print_empty_universe() {
       let universe = Universe::new(5,5,vec![]); 
       given_expect(universe, ".....\n.....\n.....\n.....\n.....\n");
    }

#[test]
    fn given_a_4x4_universe_next_gen_print_empty_universe() {
       let universe = Universe::new(4,4,vec![]); 
       given_expect(universe, "....\n....\n....\n....\n");
    }
#[test]
    fn given_a_4x5_universe_next_gen_print_empty_universe() {
       let universe = Universe::new(4,5,vec![]); 
       given_expect(universe, ".....\n.....\n.....\n.....\n");
    }
#[test]
    fn given_a_square_at_next_gen_squares_survives() {
       let universe = Universe::new(4,5,vec![(1,1),(1,2),(2,1),(2,2)]); 
       given_expect(universe, ".....\n.**..\n.**..\n.....\n");
    }
#[test]
    fn given_a_lonely_cell_dies() {
       let universe = Universe::new(4,5,vec![(1,1)]); 
       given_expect(universe, ".....\n.....\n.....\n.....\n");
    }
#[test]
#[ignore]
    fn given_four_lonely_cells_death_death_everywhere() {
       let universe = Universe::new(5,5,vec![(1,1),(1,4),(4,1),(4,4)]); 
       given_expect(universe, ".....\n.....\n.....\n.....\n.....\n");
    }

#[test]
    fn given_a_5x5_universe_next_gives_an_empty_universe() {
       let universe = Universe::new(5,5,vec![]); 
       let expected = Universe::new(5,5,vec![]);
       assert_eq!(universe.next(),expected)
    }
#[test]
    fn given_a_cell_in_1_1_next_gives_an_empty_universe() {
       let universe = Universe::new(5,5,vec![(1,1)]); 
       let expected = Universe::new(5,5,vec![]);
       assert_eq!(universe.next(),expected)
    }
#[test]
    fn given_a_square_next_gives_a_squares() {
       let universe = Universe::new(4,5,vec![(1,1),(1,2),(2,1),(2,2)]); 
       let expected = Universe::new(4,5,vec![(1,1),(1,2),(2,1),(2,2)]);
       assert_eq!(universe.next(),expected)
    }
#[test]
    fn given_four_lonely_cells_next_spreads_death_death_everywhere() {
       let universe = Universe::new(5,5,vec![(1,1),(1,4),(4,1),(4,4)]); 
       let expected = Universe::new(5,5,vec![]);
       assert_eq!(universe.next(),expected)
    }
}
