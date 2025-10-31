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
    fn hello_world() {
        assert_that(&hello(None)).is_equal_to("Hello world".to_string())
    }

    #[test]
    fn un_jeu_est_vide_a_qui_de_jouer() {
        assert_that(&hello(Some("foo"))).is_equal_to("Hello foo".to_string())
    }
}
