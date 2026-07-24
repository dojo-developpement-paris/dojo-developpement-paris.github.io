use std::{fmt, ops::Add};

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum Digit {
    M,
    D,
    C,
    L,
    X,
    V,
    I,
}

impl Digit {
    fn value(self) -> u16 {
        match self {
            Digit::M => 1_000,
            Digit::D => 500,
            Digit::C => 100,
            Digit::L => 50,
            Digit::X => 10,
            Digit::V => 5,
            Digit::I => 1,
        }
    }

    fn all_digits() -> Vec<Digit> {
        vec![
            Digit::M,
            Digit::D,
            Digit::C,
            Digit::L,
            Digit::X,
            Digit::V,
            Digit::I,
        ]
    }
}

impl fmt::Display for Digit {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Digit::M => "M",
                Digit::D => "D",
                Digit::C => "C",
                Digit::L => "L",
                Digit::X => "X",
                Digit::V => "V",
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

pub fn to_roman(arg: u16) -> Roman {
    if arg == 0 {
        return Roman::new(vec![]);
    }

    let digit = Digit::all_digits()
        .into_iter()
        .find(|digit| arg >= digit.value())
        .unwrap_or(Digit::I);
    Roman::from(digit) + to_roman(arg - digit.value())
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
        check_roman(3, "III");
        check_roman(5, "V");
        check_roman(550, "DL");
    }

    fn check_roman(number: u16, roman: &str) {
        assert_that(&to_roman(number).to_string()).is_equal_to(String::from(roman));
    }
}
