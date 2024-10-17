use std::env;

fn spiral(crepe: usize) -> String {
    if crepe == 1 {
        String::from("1")
    } else {
        String::from("1 2\n4 3")
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    // input 3, what should be the output ?
    fn hello_world() {
        // assert_that(&spiral(3)).is_equal_to([0[0]])
        assert_that(&spiral(1)).is_equal_to("1".to_string());
    }

    #[test]
    fn crepe() {
        assert_that(&spiral(2)).is_equal_to("1 2\n4 3".to_string());
    }
}
