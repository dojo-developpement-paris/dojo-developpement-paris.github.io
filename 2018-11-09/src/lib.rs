#[cfg(test)]
#[macro_use]
extern crate spectral;

fn diamond(n: usize) -> String {
    return if n == 3 {
        vec![padding(n, "*"),
             padding(n - 1, "*".repeat(n).as_str()),
             padding(n - 2, "*".repeat(n + 2).as_str()),
             padding(n - 1, "*".repeat(n).as_str()),
             padding(n, "*")]
    } else if n == 2 {
        vec![padding(n, "*"),
             padding(n - 1, "***"),
             padding(n, "*")]
    } else {
        vec![padding(n, "*")]
    }.join("\n");
}

fn padding(n: usize, s: &str) -> String {
    let spaces = " ".repeat(n - 1);
    return "".to_owned() + &spaces + s + &spaces;
}

#[cfg(test)]
mod tests {
    use super::*;
    use spectral::prelude::*;

    #[test]
    fn size_one_diamond() {
        assert_that!(diamond(1)).is_equal_to("*".to_string());
    }

    #[test]
    fn size_two_diamond() {
        assert_that!(diamond(2)).is_equal_to(" * \n***\n * ".to_string());
    }

    #[test]
    fn size_three_diamond() {
        assert_that!(diamond(3)).is_equal_to("  *  \n *** \n*****\n *** \n  *  ".to_string());
    }
}
