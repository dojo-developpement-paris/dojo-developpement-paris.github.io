fn score(rolls: &[u16]) -> u16 {
    fn my_loop(x: usize, rolls: &[u16], score: u16) -> u16 {
        if let Some(first) = rolls.get(x) {
            let second = rolls.get(x + 1).unwrap();
            if first + second == 10 {
                let third = rolls.get(x + 2).unwrap();
                my_loop(x + 2, rolls, score + 10 + third)
            } else {
                my_loop(x + 2, rolls, score + first + second)
            }
        } else {
            score
        }
    }
    my_loop(0, rolls, 0)
}

#[cfg(test)]
mod should {
    use super::*;

    #[test]
    fn gutter_game() {
        let game = roll_many(0, 20);
        assert_eq!(score(&game), 0);
    }

    #[test]
    fn ones_only_game() {
        let game = roll_many(1, 20);
        assert_eq!(score(&game), 20);
    }

    #[test]
    fn one_spare_game() {
        let mut game = vec![5, 5, 3];
        game.append(&mut roll_many(0, 17));
        assert_eq!(score(&game), 16);
    }

    #[test]
    fn one_spare_game2() {
        let mut game = vec![5, 5, 4];
        game.append(&mut roll_many(0, 17));
        assert_eq!(score(&game), 18);
    }

    #[test]
    fn one_spare_game3() {
        let mut game = vec![6, 4, 4];
        game.append(&mut roll_many(0, 17));
        assert_eq!(score(&game), 18);
    }

    #[test]
    fn one_spare_game4() {
        let mut game = vec![0, 0, 6, 4, 4];
        game.append(&mut roll_many(0, 15));
        assert_eq!(score(&game), 18);
    }

    #[test]
    fn one_spare_game5() {
        let mut game = vec![1, 1, 6, 4, 4];
        game.append(&mut roll_many(0, 15));
        assert_eq!(score(&game), 20);
    }

    fn roll_many(value: u16, times: usize) -> Vec<u16> {
        std::iter::repeat(value).take(times).collect()
    }
}