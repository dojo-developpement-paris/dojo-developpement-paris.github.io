#[cfg(test)]
mod tests {
    fn prime_factors(number: u64) -> Vec<u64> {
        let mut result = vec![];
        for divisor in 2..=number {
            if number % divisor == 0 {
                result.push(divisor);
                result.append(&mut prime_factors(number / divisor));
                return result;
            }
        }
        result
    }

    #[test]
    fn prime_factors_of_2_is_2() {
        assert_eq!(prime_factors(2), vec![2]);
    }

    #[test]
    fn prime_factors_of_3_is_3() {
        assert_eq!(prime_factors(3), vec![3]);
    }

    #[test]
    fn prime_factors_of_4_is_2_and_2() {
        assert_eq!(prime_factors(4), vec![2, 2]);
    }

    #[test]
    fn prime_factors_of_6_is_2_and_3() {
        assert_eq!(prime_factors(6), vec![2, 3]);
    }
    #[test]
    fn prime_factors_of_5_is_5() {
        assert_eq!(prime_factors(5), vec![5]);
    }
    #[test]
    fn prime_factors_of_60060_is_2_2_3_5_7_11_13() {
        assert_eq!(prime_factors(60060), vec![2,2,3,5,7,11,13]);
    }
    #[test]
    fn prime_factors_of_2_e_60_should_have_60_elements() {
        assert_eq!(prime_factors((2 as u64).pow(60)).len(), 60);
    }

}
