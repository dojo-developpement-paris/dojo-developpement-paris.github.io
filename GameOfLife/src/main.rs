use std::collections::HashSet;

#[derive(Hash, Eq, PartialEq, Debug)]
struct Position { 
    row : i64,
    col : i64 }

impl Position {
    pub fn new(row : i64, col : i64) -> Self {
        Position { row : row, col : col } 
    }
}
fn evolve(_ground : HashSet<Position>) -> HashSet<Position> {
    return HashSet::new();
}
mod game_of_life_should {
    use super::*;
    #[test]
    fn not_create_life_when_there_is_no_living_cell() {
        let initial_ground = HashSet::new();
        let final_ground   = HashSet::new();
        assert_eq!(final_ground, evolve(initial_ground));
    }
    #[test]
    fn let_an_isolated_cell_die() {
        let mut initial_ground = HashSet::new();
        initial_ground.insert(Position::new(0,0));
        let final_ground = HashSet::new();
        assert_eq!(final_ground, evolve(initial_ground));
    }
}
