use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}
const move_from_left_to_middle: i32 = 0;

fn next_step(initial_state: i32) -> i32 {
    move_from_left_to_middle
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn first_step_at_initial_state() {
        let initial_state = 0;
        assert_that(&next_step(initial_state)).is_equal_to(move_from_left_to_middle)
    }

    #[test]
    fn hello_foo() {
        assert_that(&hello(Some("foo"))).is_equal_to("Hello foo".to_string())
    }
}
