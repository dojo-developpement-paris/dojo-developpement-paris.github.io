fn main() {
    println!("{}", hello(None));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

#[derive(Debug, PartialEq)]
enum Element {
    Pierre,
    Ciseaux,
    Feuille,
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn pierre_bat_ciseaux() {
        //assert_that(&pcf(Pierre, Ciseaux)).is_equal_to(Pierre)
        assert_that(&Element::Pierre).is_equal_to(Element::Pierre)
    }
}
