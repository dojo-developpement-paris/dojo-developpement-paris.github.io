#[derive(Debug, PartialEq)]
pub enum Roman {
    M,
}

pub fn toRoman(_arg: i32) -> Vec<Roman> {
    vec![Roman::M]
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn hello_world() {
        assert_that(&toRoman(1_000)).is_equal_to(vec![Roman::M])
    }
}
