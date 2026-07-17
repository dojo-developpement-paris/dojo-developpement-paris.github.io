use std::fmt;

pub struct Roman {
    ones: i8,
    fives: i8,
    tens: i8,
}

impl From<u16> for Roman {
    fn from(number: u16) -> Self {
        match number {
            1 => Self {
                ones: 1,
                fives: 0,
                tens: 0,
            },
            4 => Self {
                ones: -1,
                fives: 1,
                tens: 0,
            },
            10 => Self {
                ones: 0,
                fives: 0,
                tens: 1,
            },
            _ => todo!(),
        }
    }
}

impl fmt::Display for Roman {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Self {
                    ones: 1,
                    fives: 0,
                    tens: 0,
                } => "I",
                Self {
                    ones: -1,
                    fives: 1,
                    tens: 0,
                } => "IV",
                Self {
                    ones: 0,
                    fives: 0,
                    tens: 1,
                } => "X",
                _ => todo!(),
            }
        )
    }
}

pub fn roman(number: u16) -> String {
    match number {
        10 => "X".to_string(),
        5 => "V".to_string(),
        4 => "I".to_string() + &roman(5),
        _ => "I".to_string(),
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn should_convert_1_into_i() {
        check_roman(1, "I");
        assert_that(&roman(1)).is_equal_to("I".to_string());
    }

    #[test]
    fn should_convert_10_into_x() {
        check_roman(10, "X");
        assert_that(&roman(10)).is_equal_to("X".to_string())
    }

    #[test]
    fn should_convert_4_into_iv() {
        check_roman(4, "IV");
        assert_that(&roman(4)).is_equal_to("IV".to_string())
    }

    #[test]
    fn should_convert_5_into_v() {
        assert_that(&roman(5)).is_equal_to("V".to_string())
    }

    fn check_roman(number: u16, expected: &str) {
        assert_that(&Roman::from(number).to_string()).is_equal_to(expected.to_string())
    }
}
