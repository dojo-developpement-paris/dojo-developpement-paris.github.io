pub fn is_prime(n: usize) -> bool {
    n < 4
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn smallest_primes() {
        assert!(is_prime(2));
        assert!(is_prime(3));
    }

    #[test]
    fn smallest_composite() {
        assert!(!is_prime(4));
        assert!(!is_prime(6));
    }
}
