#[derive(Debug, PartialEq)]
pub enum État {
    JauneJoue,
    RougeJoue,
    JauneGagne,
}

#[derive(Debug, PartialEq)]
pub enum ColonneJouée {
    Colonne1,
    Colonne2,
    Colonne3,
    Colonne4,
    Colonne5,
    Colonne6,
    Colonne7,
}

// colone notée de 1 à 7
type HistoriqueDeJeu = Vec<ColonneJouée>;

pub fn arbitre(partie: HistoriqueDeJeu) -> État {
    if partie
        == (vec![
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
        ])
    {
        État::JauneGagne
    } else if partie
        == (vec![
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
        ])
    {
        État::JauneGagne
    } else if partie.len() % 2 == 1 {
        État::RougeJoue
    } else {
        État::JauneJoue
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    mod alternance_des_joueurs {
        use super::*;
        #[test]
        fn grille_vide_c_est_jaune_qui_demarre() {
            assert_that(&arbitre(vec![])).is_equal_to(État::JauneJoue)
        }

        #[test]
        fn rouge_joue_en_deuxieme() {
            assert_that(&arbitre(vec![ColonneJouée::Colonne1])).is_equal_to(État::RougeJoue)
        }

        #[test]
        fn rouge_joue_en_quatrieme() {
            assert_that(&arbitre(vec![
                ColonneJouée::Colonne1,
                ColonneJouée::Colonne1,
                ColonneJouée::Colonne1,
            ]))
            .is_equal_to(État::RougeJoue)
        }
    }
    #[test]
    fn toutes_les_colonnes_sont_jouées_une_fois() {
        assert_that(&arbitre(vec![
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne3,
            ColonneJouée::Colonne4,
            ColonneJouée::Colonne5,
            ColonneJouée::Colonne6,
            ColonneJouée::Colonne7,
        ]))
        .is_equal_to(État::RougeJoue)
    }
    #[test]
    fn quatre_coups_sur_la_meme_colonne_gagnent() {
        assert_that(&arbitre(vec![
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne2,
            ColonneJouée::Colonne1,
        ]))
        .is_equal_to(État::JauneGagne)
    }
    #[test]
    fn quatre_coups_sur_la_meme_colonne_gagnent_encore() {
        assert_that(&arbitre(vec![
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
            ColonneJouée::Colonne7,
            ColonneJouée::Colonne1,
        ]))
        .is_equal_to(État::JauneGagne)
    }
}

/*
- A - 4 - event sourcing (aka historique des actions)
- B - 2 - tableau de taille 7 de vecteurs
- C - 3 - tableau de tableaux de taille fixe 6*7
- D - 0 - tableau de taille fixe avec un pointeur de la hauteur de jetons
*/
