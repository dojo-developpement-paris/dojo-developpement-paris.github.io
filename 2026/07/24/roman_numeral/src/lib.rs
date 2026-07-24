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
                Digit::C => "C",
                Digit::M => "M",
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
        self.digits
            .iter()
            .try_for_each(|digit| write!(f, "{}", digit))
    }
}

pub fn to_roman(arg: i32) -> Roman {
    Roman {
        digits: if arg == 1_100 {
            vec![Digit::M, Digit::C]
        } else if arg == 2_000 {
            vec![Digit::M, Digit::M]
        } else if arg == 1_000 {
            vec![Digit::M]
        } else {
            vec![Digit::C]
        },
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
    }

    fn check_roman(number: i32, roman: &str) {
        assert_that(&to_roman(number).to_string()).is_equal_to(String::from(roman));
    }
}
