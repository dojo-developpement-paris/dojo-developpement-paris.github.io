use std::fmt;

#[derive(Debug, PartialEq)]
pub enum Digit {
    C,
    M,
}

impl fmt::Display for Digit {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Digit::M => "M",
                Digit::C => "C",
            }
        )
    }
}

#[derive(Debug, PartialEq)]
pub struct Roman {
    digits: Vec<Digit>,
}

impl fmt::Display for Roman {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.digits.first().unwrap())
    }
}

pub fn to_roman(arg: i32) -> Roman {
    Roman {
        digits: vec![if arg == 1_000 { Digit::M } else { Digit::C }],
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
    }

    fn check_roman(number: i32, roman: &str) {
        assert_that(&to_roman(number).to_string()).is_equal_to(String::from(roman));
    }
}
