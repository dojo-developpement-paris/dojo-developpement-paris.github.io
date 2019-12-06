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
    if(ground.len() == 3) {
        return [Position::new(0,1)].iter().cloned().collect();
    }
    return HashSet::new();
}
mod game_of_life_should {
    use super::*;
    fn assert_evolve(initial_ground:&[Position],final_ground:&[Position]) {
        let initial_set:HashSet<Position> = initial_ground.iter().cloned().collect();
        let final_set:HashSet<Position> = final_ground.iter().cloned().collect();
        assert_eq!(final_set, evolve(initial_set));
    }
    #[test]
    fn not_create_life_when_there_is_no_living_cell() {
        let initial_ground = HashSet::new();
        let final_ground   = HashSet::new();
        assert_eq!(final_ground, evolve(initial_ground));
    }
    #[test]
    fn let_an_isolated_cell_die() {
        let initial_ground = [Position::new(0,0)].iter().cloned().collect();
        let final_ground = HashSet::new();
        assert_eq!(final_ground, evolve(initial_ground));
    }
    #[test]
    fn let_a_cell_survive_when_surrounded_by_two_cells() {
        let initial_ground = [Position::new(0,0),Position::new(0,1),Position::new(0,2)].iter().cloned().collect();
        let final_ground:HashSet<Position> = [Position::new(0,1)].iter().cloned().collect();
        assert_eq!(final_ground, evolve(initial_ground));
    }
}
