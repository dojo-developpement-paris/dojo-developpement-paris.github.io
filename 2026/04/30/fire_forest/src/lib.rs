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

fn state(_forest: Forest, _x: usize, _y: usize) -> State {
    State::Earth
}

fn plant_tree(_forest: Forest, _x: usize, _y: usize) -> Forest {
    todo!()
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

    // #[test]
    // fn planting_tree() {
    //     let initial_forest = Forest::new();
    //     let forest = plant_tree(initial_forest, 0, 0);
    //     assert_that(&state(forest, 0, 0)).is_equal_to(State::Tree)
    // }
}
