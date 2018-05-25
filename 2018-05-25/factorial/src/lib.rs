#![feature(fnbox)]
extern crate num_bigint;
use std::str::FromStr;
use num_bigint::*;
use std::boxed::FnBox;
// plan
// 0 find a library for big ints in Rust
// 1 factorial without recursion
// 2 factorial with recursion
// 3 tail call optimization

fn factorial(n : u64) -> BigUint {
    let mut result = BigUint::from(1_u64); 
    let mut i = 1;
    while i <= n {
        result *= BigUint::from(i);
        i += 1;
    }
    result
}

enum TailRec { Done(BigUint), Continue(Box<FnBox()->TailRec>) }

fn factorial_rec(n : u64) -> BigUint {
    fn factorial_tail_rec(n : u64, acc : BigUint) -> TailRec {
        if n == 1 {
            TailRec::Done(acc)
        } else {
            TailRec::Continue(Box::new(move || factorial_tail_rec(n-1, acc*BigUint::from(n))))
        }
    }
    let mut step = factorial_tail_rec(n, BigUint::from(1_u64));
    loop {
        match step {
            TailRec::Done(result) => return result,
            TailRec::Continue(next_step) => step = next_step()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn yield_factorial() {
        assert_eq!(factorial(1), BigUint::from(1_u64));
        assert_eq!(factorial(2), BigUint::from(2_u64));
        assert_eq!(factorial(3), BigUint::from(6_u64));
        assert_eq!(factorial(4), BigUint::from(24_u64));
        let fac64= BigUint::from_str("126886932185884164103433389335161480802865516174545192198801894375214704230400000000000000").unwrap();
        assert_eq!(factorial(64), fac64);
    }
    #[test]
    fn yield_factorial_rec() {
        assert_eq!(factorial_rec(1), factorial(1));
        assert_eq!(factorial_rec(2), factorial(2));
        assert_eq!(factorial_rec(3), factorial(3));
        assert_eq!(factorial_rec(4), factorial(4));
    }
    #[test]
    fn factorial_rec_makes_stack_overflow() {
        assert_eq!(factorial_rec(10000), factorial(10000));
    }
}
