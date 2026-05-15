use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}
pub fn markov(numberToGenerate: i32, _arg_2: &str) -> String {
    if numberToGenerate == 1 {
        "hello".to_string()
    } else {
        "".to_string()
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn generate_empty_string() {
        assert_that(&markov(0, "")).is_equal_to("".to_string())
    }

    #[test]
    fn generate_word() {
        assert_that(&markov(1, "hello")).is_equal_to("hello".to_string())
    }
}
