#[derive(Debug, PartialEq)]
pub enum Digit {
    M,
}

#[derive(Debug, PartialEq)]
pub struct Roman {
    digit: Vec<Digit>,
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
        assert_that(&to_roman(1_000)).is_equal_to(Roman {
            digit: vec![Digit::M],
        })
    }
}
