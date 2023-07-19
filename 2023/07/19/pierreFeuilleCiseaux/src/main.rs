fn main() {
    println!("{}", hello(None));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

fn pcf(gauche: Element, droite: Element) -> Element {
    if gauche == droite {
        return Element::Null;
    }
    gauche
}

#[derive(Debug, PartialEq)]
enum Element {
    Pierre,
    Ciseaux,
    Feuille,
    Null,
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn pierre_bat_ciseaux() {
        assert_that(&pcf(Element::Pierre, Element::Ciseaux)).is_equal_to(Element::Pierre)
    }

    #[test]
    fn ciseaux_bat_feuille() {
        assert_that(&pcf(Element::Ciseaux, Element::Feuille)).is_equal_to(Element::Ciseaux)
    }

    #[test]
    fn ciseaux_egalent_ciseaux() {
        assert_that(&pcf(Element::Ciseaux, Element::Ciseaux)).is_equal_to(Element::Null)
    }
}
