/// Three 1's => 1000 points
///  Three 6's =>  600 points
///  Three 5's =>  500 points
///  Three 4's =>  400 points
///  Three 3's =>  300 points
///  Three 2's =>  200 points
///  One   1   =>  100 points
///  One   5   =>   50 point
///
/// Throw       Score
/// ---------   ------------------
///  5 1 3 4 1   250:  50 (for the 5) + 2 * 100 (for the 1s)
///  1 1 1 3 1   1100: 1000 (for three 1s) + 100 (for the other 1)
///  2 4 4 5 4   450:  400 (for three 4s) + 50 (for the 5)

#[derive(Debug, PartialEq)]
enum Die {
    One,
    Two,
    Three,
    Four,
    Five,
    Six,
}

use Die::*;

fn score(throw: [Die; 5]) -> usize {
    let mut result = 0;

    result += score_for_value(&throw, (Five, 50));

    result += score_for_value(&throw, (One, 100));

    result
}

fn score_for_value(throw: &[Die; 5], tupperware: (Die, usize)) -> usize {
    throw.iter().filter(|&d| *d == tupperware.0).count() * tupperware.1
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn test() {
        assert_that(&score([Two, Three, Four, Six, Six])).is_equal_to(0);
        assert_that(&score([Two, Three, Four, Five, Six])).is_equal_to(50);
        assert_that(&score([Five, Two, Three, Four, Six])).is_equal_to(50);
        assert_that(&score([Five, Two, Three, Five, Six])).is_equal_to(100);
        assert_that(&score([One, Two, Three, One, Six])).is_equal_to(200);
    }
}
