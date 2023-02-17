#[cfg(test)]
#[macro_use]
extern crate quickcheck;

#[derive(PartialEq, Debug, Clone, Copy)]
enum Color {
    RED,
    BLACK,
    BLUE,
    YELLOW,
    GREEN,
    PURPLE,
}

#[derive(PartialEq, Debug, Clone, Copy)]
struct Line(Color, Color, Color, Color);
type Combination = Line;
type Trial = Line;

fn master_mind(combination: &[Color], trial: &[Color]) -> (u32, u32) {
    let mut well_placed = 0;
    for (index, color) in combination.iter().enumerate() {
        if &trial[index] == color {
            well_placed += 1;
        }
    }
    (well_placed, 0)
}

fn master_mind2(combination: Combination, trial: Trial) -> (u32, u32) {
    master_mind(
        &vec![combination.0, combination.1, combination.2, combination.3],
        &vec![trial.0, trial.1, trial.2, trial.3],
    )
}

#[cfg(test)]
mod test {
    use super::*;
    use quickcheck::*;
    use speculoos::*;
    use Color::*;

    #[test]
    fn no_match() {
        let combination = vec![RED, RED, RED, RED];

        let trial = vec![BLACK, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((0, 0));
    }

    #[test]
    fn first_one_well_placed() {
        let combination = vec![RED, RED, RED, RED];

        let trial = vec![RED, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((1, 0));
    }

    #[test]
    fn first_one_well_placed_again() {
        let combination = vec![BLUE, BLUE, BLUE, BLUE];

        let trial = vec![BLUE, BLACK, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((1, 0));
    }

    #[test]
    fn second_one_well_placed() {
        let combination = vec![BLUE, BLUE, BLUE, BLUE];

        let trial = vec![BLACK, BLUE, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((1, 0));
    }

    #[test]
    fn first_two_well_placed() {
        let combination = vec![BLUE, BLUE, BLUE, BLUE];

        let trial = vec![BLUE, BLUE, BLACK, BLACK];

        let answer = master_mind(&combination, &trial);

        assert_that!(answer).is_equal_to((2, 0));
    }

    impl Arbitrary for Color {
        fn arbitrary(generator: &mut Gen) -> Color {
            generator
                .choose(&[BLUE, BLACK, RED, YELLOW, GREEN, PURPLE])
                .expect("generator cassé")
                .clone()
        }
    }

    impl Arbitrary for Line {
        fn arbitrary(generator: &mut Gen) -> Line {
            Line(
                Color::arbitrary(generator),
                Color::arbitrary(generator),
                Color::arbitrary(generator),
                Color::arbitrary(generator),
            )
            .clone()
        }
    }

    quickcheck! {
        fn prop2(combination: Vec<Color>, trial: Vec<Color>) -> TestResult {
            if combination.len() != trial.len() || combination.len() != 4 {
                TestResult::discard()
            } else {
                println!("{:#?} {:#?}", combination, trial);

                let result = (master_mind(&combination, &trial)) == master_mind(&trial, &combination);
                TestResult::from_bool(result)
            }
        }
    }

    quickcheck! {
        fn prop3(combination: Combination, trial: Trial) -> bool {
            println!("combination {:#?} trial {:#?}", combination, trial);
            (master_mind2(combination, trial)) == master_mind2(trial, combination)
        }
    }

    fn reverse<T: Clone>(xs: &[T]) -> Vec<T> {
        let mut rev = vec![];
        for x in xs.iter() {
            rev.insert(0, x.clone())
        }
        rev
    }

    quickcheck! {
        fn prop(xs: Vec<u32>) -> bool {
            xs == reverse(&reverse(&xs))
        }
    }
}
