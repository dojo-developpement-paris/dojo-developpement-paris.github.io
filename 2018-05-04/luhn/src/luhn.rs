const MAX_NUMBER_OF_DIGITS: u32 = 19;

pub fn luhn(n: u64) -> bool {
    (0..MAX_NUMBER_OF_DIGITS).fold(0, |acc, index| {
        acc + sum_digit(index, digit_at(index, n))
    }) % 10 == 0
}

fn digit_at(index: u32, number: u64) -> u64 {
    (number % 10_u64.pow(index + 1)) / 10_u64.pow(index)
}

fn sum_digit(index: u32, digit: u64) -> u64 {
    let result = digit * (1 + (index % 2) as u64);
    result - (9 * (result / 10))
}

#[cfg(test)]
mod should {
    use super::*;

    #[test]
    fn be_false_for_123() {
        assert_eq!(luhn(123), false);
    }

    #[test]
    fn be_true_for_18() {
        assert_eq!(luhn(18), true);
    }

    #[test]
    fn be_true_for_26() {
        assert_eq!(luhn(26), true);
    }

    #[test]
    fn be_true_for_109() {
        assert_eq!(luhn(109), true);
    }

    #[test]
    fn be_true_for_83() {
        assert_eq!(luhn(83), true);
    }


    #[test]
    fn be_true_for_992() {
        assert_eq!(luhn(992), true);
    }

    #[test]
    fn be_true_for_489682005() {
        assert_eq!(luhn(489682005), true);
    }

    #[test]
    fn be_true_for_4697592777636222() {
        assert_eq!(luhn(4697592777636222), true);
    }
}
