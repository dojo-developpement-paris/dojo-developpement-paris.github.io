use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn pas_d_appel() {
        assert_that(&elevator(0, vec![])).is_equal_to(0)
    }

    fn elevator(_arg_1: i32, _arg_2: Vec<i32>) -> i32 {
        0
    }
}
