/*
A burning cell turns into an empty cell
A tree will burn if at least one neighbor is burning
A tree ignites with probability f even if no neighbor is burning
An empty space fills with a tree with probability p
*/
#[derive(Debug, PartialEq)]
enum State {
    Earth,
    Fire,
    Tree,
}
#[derive(Debug, PartialEq)]
struct Forest {
    state: State,
}

impl Forest {
    fn new() -> Forest {
        Forest {
            state: State::Earth,
        }
    }
}

fn state(forest: Forest, _x: usize, _y: usize) -> State {
    forest.state
}

fn plant_tree(_forest: Forest, _x: usize, _y: usize) -> Forest {
    Forest { state: State::Tree }
}

fn evolve(forest: Forest, _fire_factor: f32) -> Forest {
    match forest {
        Forest { state: State::Fire } => Forest::new(),
        _ => forest,
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_forest_is_empty() {
        let forest = Forest::new();
        assert_that(&state(forest, 0, 0)).is_equal_to(State::Earth)
    }

    #[test]
    fn a_forest_with_a_burning_tree_evolve_into_earth_where_that_tree_was_burning() {
        let forest = Forest { state: State::Fire };
        let new_forest = evolve(forest, 0.0);
        assert_that(&state(new_forest, 0, 0)).is_equal_to(State::Earth)
    }

    #[test]
    fn a_forest_without_fire_stays_the_same() {
        let initial_forest = Forest::new();
        let forest = plant_tree(initial_forest, 0, 0);
        let new_forest = evolve(forest, 0.0);
        assert_that(&state(new_forest, 0, 0)).is_equal_to(State::Tree)
    }

    #[test]
    fn planting_tree() {
        let initial_forest = Forest::new();
        let forest = plant_tree(initial_forest, 0, 0);
        assert_that(&state(forest, 0, 0)).is_equal_to(State::Tree)
    }
}
