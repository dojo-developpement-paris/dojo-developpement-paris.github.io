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
        if gauche == Element::Ciseaux {
            return Verdict::Droite(Element::Pierre);
        }
        return Verdict::Gauche(Element::Ciseaux);
    }
    if gauche == Element::Ciseaux && droite == Element::Feuille {
        return Verdict::Gauche(Element::Ciseaux);
    }
    if droite == Element::Ciseaux && gauche == Element::Feuille {
        return Verdict::Droite(Element::Ciseaux);
    }
    if droite == Element::Feuille && gauche == Element::Pierre {
        return Verdict::Droite(Element::Feuille);
    }
    if gauche == Element::Feuille && droite == Element::Pierre {
        return Verdict::Gauche(Element::Feuille);
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
            .is_equal_to(Verdict::Gauche(Element::Ciseaux));

        assert_that(&pcf(Element::Feuille, Element::Ciseaux))
            .is_equal_to(Verdict::Droite(Element::Ciseaux));
    }

    #[test]
    fn feuille_bat_pierre() {
        assert_that(&pcf(Element::Feuille, Element::Pierre))
            .is_equal_to(Verdict::Gauche(Element::Feuille));

        assert_that(&pcf(Element::Pierre, Element::Feuille))
            .is_equal_to(Verdict::Droite(Element::Feuille));
    }

    #[test]
    fn mains_egalent_font_une_egalite() {
        assert_that(&pcf(Element::Ciseaux, Element::Ciseaux)).is_equal_to(Verdict::Egalite);

        assert_that(&pcf(Element::Feuille, Element::Feuille)).is_equal_to(Verdict::Egalite);

        assert_that(&pcf(Element::Pierre, Element::Pierre)).is_equal_to(Verdict::Egalite);
    }
}
