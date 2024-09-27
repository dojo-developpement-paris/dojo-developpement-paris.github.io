pub fn is_prime(n: usize) -> bool {
    if n == 1 {
        return false;
    }

    if n % 2 == 0 {
        return n == 2;
    }

    if n % 3 == 0 {
        return n == 3;
    }

    if n % 5 == 0 {
        return n == 5;
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
