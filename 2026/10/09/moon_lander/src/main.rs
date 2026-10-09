use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

pub fn initial_state() {}

pub fn height(_ship: ()) -> f64 {
    50.0
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_height_is_50() {
        let ship = initial_state();
        assert_that(&height(ship)).is_equal_to(50.0f64)
    }
}
