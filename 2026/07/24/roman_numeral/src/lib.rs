use std::{fmt, ops::Add};

#[derive(Debug, PartialEq, Clone)]
pub enum Digit {
    M,
    C,
    X,
    I,
}

impl fmt::Display for Digit {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Digit::M => "M",
                Digit::C => "C",
                Digit::X => "X",
                Digit::I => "I",
            }
        )
    }
}

#[derive(Debug, PartialEq)]
pub struct Roman {
    digits: Vec<Digit>,
}

impl Roman {
    pub fn new(digits: Vec<Digit>) -> Self {
        Self { digits }
    }
}

impl From<Digit> for Roman {
    fn from(digit: Digit) -> Self {
        Self::new(vec![digit])
    }
}

impl fmt::Display for Roman {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.digits
            .iter()
            .try_for_each(|digit| write!(f, "{}", digit))
    }
}

impl Add<Roman> for Roman {
    type Output = Roman;

    fn add(self, other: Roman) -> Self::Output {
        let mut new_digits = self.digits.clone();
        new_digits.extend(other.digits.clone());
        Roman { digits: new_digits }
    }
}

pub fn to_roman(arg: i32) -> Roman {
    if arg == 0 {
        return Roman::new(vec![]);
    }

    if arg >= 1_000 {
        Roman::from(Digit::M) + to_roman(arg - 1000)
    } else if arg >= 100 {
        Roman::from(Digit::C) + to_roman(arg - 100)
    } else if arg >= 10 {
        Roman::from(Digit::X) + to_roman(arg - 10)
    } else {
        Roman::from(Digit::I)
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn check_romans() {
        check_roman(1_000, "M");
        check_roman(100, "C");
        check_roman(2_000, "MM");
        check_roman(1_100, "MC");
        check_roman(110, "CX");
        check_roman(1, "I");
    }

    fn check_roman(number: i32, roman: &str) {
        assert_that(&to_roman(number).to_string()).is_equal_to(String::from(roman));
    }
}
