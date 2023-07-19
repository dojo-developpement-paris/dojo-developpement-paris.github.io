#[derive(Debug, PartialEq)]
enum Element {
    Pierre,
    Ciseaux,
    Feuille,
}

#[derive(Debug, PartialEq)]
enum Verdict {
    Gauche(Element),
    Droite(Element),
    Egalite,
}

fn pcf(gauche: Element, droite: Element) -> Verdict {
    if gauche == droite {
        return Verdict::Egalite;
    }
    if droite == Element::Pierre {
        return Verdict::Droite(Element::Pierre);
    }
    if droite == Element::Feuille && gauche == Element::Pierre {
        return Verdict::Droite(Element::Feuille);
    }
    Verdict::Gauche(gauche)
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn pierre_bat_ciseaux() {
        assert_that(&pcf(Element::Pierre, Element::Ciseaux))
            .is_equal_to(Verdict::Gauche(Element::Pierre));

        assert_that(&pcf(Element::Ciseaux, Element::Pierre))
            .is_equal_to(Verdict::Droite(Element::Pierre));
    }

    #[test]
    fn ciseaux_bat_feuille() {
        assert_that(&pcf(Element::Ciseaux, Element::Feuille))
            .is_equal_to(Verdict::Gauche(Element::Ciseaux))
    }

    #[test]
    fn feuille_bat_pierre() {
        assert_that(&pcf(Element::Pierre, Element::Feuille))
            .is_equal_to(Verdict::Droite(Element::Feuille))
    }

    #[test]
    fn mains_egalent_font_une_egalite() {
        assert_that(&pcf(Element::Ciseaux, Element::Ciseaux)).is_equal_to(Verdict::Egalite);

        assert_that(&pcf(Element::Feuille, Element::Feuille)).is_equal_to(Verdict::Egalite);

        assert_that(&pcf(Element::Pierre, Element::Pierre)).is_equal_to(Verdict::Egalite);
    }
}
