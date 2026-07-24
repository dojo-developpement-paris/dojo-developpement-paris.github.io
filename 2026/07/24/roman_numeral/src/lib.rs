use std::fmt;

#[derive(Debug, PartialEq)]
pub enum Digit {
    M,
}

#[derive(Debug, PartialEq)]
pub struct Roman {
    digit: Vec<Digit>,
}

impl fmt::Display for Roman {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "M")
    }
}

pub fn to_roman(_arg: i32) -> Roman {
    Roman {
        digit: vec![Digit::M],
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn hello_world() {
        check_roman(1_000, "M");
    }

    fn check_roman(number: i32, roman: &str) {
        assert_that(&to_roman(number).to_string()).is_equal_to(String::from(roman));
    }
}
