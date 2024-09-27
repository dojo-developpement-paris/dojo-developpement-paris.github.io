pub fn is_prime(number: usize) -> bool {
    if number == 1 {
        return false;
    }

    if number == 2 {
        return true;
    }

    let mut divisor = 2;
    while divisor * divisor <= number {
        if number % divisor == 0 {
            return false;
        }
        divisor += 1;
    }

    true
}

pub fn number_of_primes(start: usize, end: usize) -> usize {
    (start..end)
        .filter(|number: &usize| is_prime(*number))
        .count()
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn hein() {
        assert!(!is_prime(1));
    }

    #[test]
    fn smallest_primes() {
        assert!(is_prime(2));
        assert!(is_prime(3));
        assert!(is_prime(5));
        assert!(is_prime(7));
    }

    #[test]
    fn big_prime() {
        assert!(is_prime(999_983));
    }

    #[test]
    fn smallest_composite() {
        assert!(!is_prime(4));
        assert!(!is_prime(6));
        assert!(!is_prime(9));
        assert!(!is_prime(25));
        assert!(!is_prime(50));
    }

    #[test]
    fn how_many_primes() {
        assert_eq!(number_of_primes(2, 100), 25);
        assert_eq!(number_of_primes(2, 10), 4);
        assert_eq!(number_of_primes(2, 100_000), 9_592);
        assert_eq!(number_of_primes(2, 500_000), 41_538);
        assert_eq!(number_of_primes(2, 1_000_000), 78_498);
        assert_eq!(number_of_primes(2, 10_000_000), 664_579);
        // assert_eq!(number_of_primes(2, 100_000_000), 5_761_455);
        // assert_eq!(number_of_primes(2, 1_000_000_000), 50_847_534);
    }
}
