// trouver l'algo général
// ignorer les cas limites pour le moment +1
// faire en babysteps +1
// moins de renommage plus d'implem
// réfléchir à l'algo général +1 (sans forcement le coder)
// trouver comment babysteper avec un algo récursif
// attendre un consensus pour nos décisions

fn solution(numbers: Vec<isize>, target: isize) -> Option<Vec<isize>> {
    dbg!(&numbers, &target);
    if numbers.len() == 1 {
        if numbers[0] == target {
            Some(numbers)
        } else {
            None
        }
    } else {
        let tail = numbers[1..].to_vec();
        let target_minus_head = target - numbers[0];
        let rec = solution(tail, target_minus_head);
        if rec?.is_empty() {
            let combination = numbers[0] * 10 + numbers[1];
            solution(vec![combination], target)
        } else {
            Some(numbers)
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn given_one_digit_it_is_already_the_solution() {
        assert_that(&solution(vec![4], 4)).is_equal_to(Some(vec![4]));
        assert_that(&solution(vec![5], 5)).is_equal_to(Some(vec![5]));
    }

    #[test]
    fn two_digits_in_the_expresssion() {
        assert_that(&solution(vec![4, 3], 7)).is_equal_to(Some(vec![4, 3]));
        assert_that(&solution(vec![4, 3], 43)).is_equal_to(Some(vec![43]));
        assert_that(&solution(vec![1, 4], 5)).is_equal_to(Some(vec![1, 4]));
        assert_that(&solution(vec![1, 4], 14)).is_equal_to(Some(vec![14]));
    }

    #[test]
    fn given_one_digit_and_a_different_target_no_solution() {
        assert_that(&solution(vec![4], 5)).is_equal_to(None)
    }

    #[test]
    fn given_two_digits_no_solution() {
        assert_that(&solution(vec![1, 4], 7)).is_equal_to(None)
    }

    // #[test]
    #[allow(dead_code)]
    fn acceptance_test() {
        assert_that(&solution(vec![4, 7, 3, 2], 52)).is_equal_to(Some(vec![47, 3, 2]))
    }
}
