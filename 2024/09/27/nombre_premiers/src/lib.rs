pub fn is_prime(number: usize) -> bool {
    if number == 1 {
        return false;
    }

    if number % 2 == 0 {
        return number == 2;
    }

    for divisor in 2..number {
        if number % divisor == 0 {
            return false;
        }
    }

    true
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
    }

    #[test]
    fn smallest_composite() {
        assert!(!is_prime(4));
        assert!(!is_prime(6));
        assert!(!is_prime(9));
        assert!(!is_prime(25));
    }
}
