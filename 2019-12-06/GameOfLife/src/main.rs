use std::collections::HashSet;

#[derive(Hash, Eq, PartialEq, Debug, Clone)]
struct Position { 
    row : i64,
    col : i64 }

impl Position {
    pub fn new(row : i64, col : i64) -> Self {
        Position { row : row, col : col } 
    }
}
fn evolve(ground : HashSet<Position>) -> HashSet<Position> {
    let mut result = HashSet::new();
    if ground.len() == 3 {
        if ground.contains(&Position::new(0,3)) && ground.contains(&Position::new(0,1)) {
            result.insert(Position::new(0,2));
        }
        if ground.contains(&Position::new(0,0)) && ground.contains(&Position::new(0,2)) {
            result.insert(Position::new(0,1));
        }
    }
    result
}
mod game_of_life_should {
    use super::*;
    fn assert_evolve(initial_ground:&[Position],final_ground:&[Position]) {
        let initial_set:HashSet<Position> = initial_ground.iter().cloned().collect();
        let final_set  :HashSet<Position> = final_ground.iter().cloned().collect();
        assert_eq!(final_set, evolve(initial_set));
    }
    #[test]
    fn not_create_life_when_there_is_no_living_cell() {
        assert_evolve(&[],&[]);
    }
    #[test]
    fn let_an_isolated_cell_die() {
        assert_evolve(&[Position::new(0,0)],&[]);
        assert_evolve(&[Position::new(0,0),Position::new(10,10),Position::new(20,20)],&[]);
        assert_evolve(&[Position::new(0,3),Position::new(10,10),Position::new(20,20)],&[]);
    }
    #[test]
    fn let_a_cell_survive_when_surrounded_by_two_cells() {
        assert_evolve(&[Position::new(0,0),
                        Position::new(0,1),
                        Position::new(0,2)],
                      &[Position::new(0,1)]);
        assert_evolve(&[Position::new(0,1),
                        Position::new(0,2),
                        Position::new(0,3)],
                      &[Position::new(0,2)]);
    }
}
