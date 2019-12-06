use std::collections::HashSet;

#[derive(Hash, Eq, PartialEq, Debug)]
struct Position { 
    row : i64,
    col : i64 }
fn evolve(ground : HashSet<Position>) -> HashSet<Position> {
    return HashSet::new();
}
mod game_of_life_should {
    use super::*;
    #[test]
    fn not_create_life_when_there_is_no_living_cell() {
        let initial_ground : HashSet<Position> = HashSet::new();
        let final_ground   : HashSet<Position> = HashSet::new();
        assert_eq!(final_ground, evolve(initial_ground));
    }
}
