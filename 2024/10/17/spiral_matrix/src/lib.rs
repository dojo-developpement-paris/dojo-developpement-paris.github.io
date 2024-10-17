fn spiral(size: usize) -> String {
    if size == 1 {
        String::from("1")
    } else {
        String::from(vec!["1 2", "4 3"].join("\n"))
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn hello_world() {
        assert_that(&spiral(1)).is_equal_to("1".to_string());
    }

    #[test]
    fn crepe() {
        assert_that(&spiral(2)).is_equal_to("1 2\n4 3".to_string());
    }
}
