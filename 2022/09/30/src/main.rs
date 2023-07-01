#[derive(PartialEq)]
enum Main {
    Feuille,
    Ciseaux,
}

fn combattre(a: Main, b: Main) -> String {
    if a == Main::Ciseaux && b == Main::Feuille {
        "ciseaux".to_string()
    } else {
        "personne".to_string()
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn ciseaux_gagne_contre_feuille() {
        assert_that(&combattre(Main::Ciseaux, Main::Feuille)).is_equal_to("ciseaux".to_string())
    }

    #[test]
    fn ne_perd_pas_feuille_contre_feuille() {
        assert_that(&combattre(Main::Feuille, Main::Feuille)).is_equal_to("personne".to_string())
    }
}
