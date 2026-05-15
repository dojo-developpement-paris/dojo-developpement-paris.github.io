use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}
fn markov(_arg_1: i32, _arg_2: &str) -> String {
    "".to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn generate_empty_string() {
        assert_that(&markov(0, "")).is_equal_to("".to_string())
    }
}
