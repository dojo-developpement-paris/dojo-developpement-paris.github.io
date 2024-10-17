use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

fn spiral(crepe: usize) -> String {
    String::from("1")
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
        assert_that(&hello(None)).is_equal_to("Hello world".to_string())
    }

    #[test]
    fn hello_foo() {
        assert_that(&hello(Some("foo"))).is_equal_to("Hello foo".to_string())
    }
}
