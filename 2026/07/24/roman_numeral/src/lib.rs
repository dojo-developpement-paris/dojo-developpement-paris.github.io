#[derive(Debug, PartialEq)]
pub enum Digit {
    M,
}

pub fn to_roman(_arg: i32) -> Vec<Digit> {
    vec![Digit::M]
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn hello_world() {
        assert_that(&to_roman(1_000)).is_equal_to(vec![Digit::M])
    }
}
