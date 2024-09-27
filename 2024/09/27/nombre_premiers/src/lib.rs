pub fn is_prime(number: &usize) -> bool {
    if *number == 1 {
        return false;
    }

    for divisor in 2..*number {
        if number % divisor == 0 {
            return false;
        }
    }

    true
}

pub fn number_of_primes(start: usize, end: usize) -> usize {
    (start..end).filter(is_prime).count()
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn hein() {
        assert!(!is_prime(&1));
    }

    #[test]
    fn smallest_primes() {
        assert!(is_prime(&2));
        assert!(is_prime(&3));
        assert!(is_prime(&5));
        assert!(is_prime(&7));
    }

    #[test]
    fn big_prime() {
        assert!(is_prime(&999_983));
    }

    #[test]
    fn smallest_composite() {
        assert!(!is_prime(&4));
        assert!(!is_prime(&6));
        assert!(!is_prime(&9));
        assert!(!is_prime(&25));
        assert!(!is_prime(&50));
    }

    #[test]
    fn how_many_primes() {
        assert_eq!(number_of_primes(2, 100), 25);
        assert_eq!(number_of_primes(2, 10), 4);
    }
}
