use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}
pub fn markov(number_of_words_to_generate: i32, training_text: &str) -> String {
    if number_of_words_to_generate == 2 {
        [
            pick_random_word(training_text),
            pick_random_word(training_text),
        ]
        .join(" ")
    } else if number_of_words_to_generate == 1 {
        [pick_random_word(training_text)].join(" ")
    } else {
        "".to_string()
    }
}

fn pick_random_word(to_string: &str) -> String {
    to_string.to_string()
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

    #[test]
    fn generate_hello_twice() {
        assert_that(&markov(2, "hello")).is_equal_to("hello hello".to_string())
    }

    #[test]
    fn generate_another_word() {
        assert_that(&markov(1, "salut")).is_equal_to("salut".to_string())
    }

    #[test]
    fn generate_several_words() {
        assert_that(&markov(2, "salut")).is_equal_to("salut salut".to_string())
    }
}
