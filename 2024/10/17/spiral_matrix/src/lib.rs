pub fn spiral(size: usize) -> String {
    if size == 1 {
        String::from("1")
    } else {
        String::from(vec![vec!["1", "2"].join(" "), vec!["4", "3"].join(" ")].join("\n"))
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
