#[derive(Debug, PartialEq)]
pub enum État {
    JauneJoue,
    RougeJoue,
}

pub enum ColonneJouée {
    Colonne1,
}

// colone notée de 1 à 7
type HistoriqueDeJeu = Vec<ColonneJouée>;

pub fn arbitre(partie: HistoriqueDeJeu) -> État {
    if partie.len() == 1 {
        État::RougeJoue
    } else {
        État::JauneJoue
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn grille_vide_c_est_jaune_qui_demarre() {
        assert_that(&arbitre(vec![])).is_equal_to(État::JauneJoue)
    }

    #[test]
    fn rouge_joue_en_deuxieme() {
        assert_that(&arbitre(vec![ColonneJouée::Colonne1])).is_equal_to(État::RougeJoue)
    }
}

/*
- A - 4 - event sourcing (aka historique des actions)
- B - 2 - tableau de taille 7 de vecteurs
- C - 3 - tableau de tableaux de taille fixe 6*7
- D - 0 - tableau de taille fixe avec un pointeur de la hauteur de jetons
*/
