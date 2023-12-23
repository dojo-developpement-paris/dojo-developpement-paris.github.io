/*
  modéliser le jeu avec une structure de donnée simple
  avancer
  jouer des tests, au moins 1 avant 21h +1 +1
  implementer au moins une règle +1
  annoncer le plan avant d'écrire du code
  bottom-up vs top-down
  commencer par les tests sans faire de la modélisation avant
  ajouter la femme et les gosses des joueurs
  ne pas perdre le code écrit
  ne pas rester dans le rouge
  enlever le code non testé
  implementer les règles pour un seul joueur pour commencer
*/

pub fn round_score(knock_down_pins: Vec<u16>) -> u16 {
    if knock_down_pins.is_empty() {
        0
    } else if knock_down_pins.len() > 1 {
        knock_down_pins.len().try_into().unwrap()
    } else {
        *knock_down_pins.get(0).unwrap()
    }
}

pub fn game_score(rounds: Vec<Vec<u16>>) -> u16 {
    rounds.iter().map(|pins| round_score(pins.to_vec())).sum()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn empty_list_mean_zero_score() {
        assert_that(&round_score(vec![])).is_equal_to(0)
    }

    #[test]
    fn shooting_12_means_score_12() {
        assert_that(&round_score(vec![12])).is_equal_to(12)
    }

    #[test]
    fn shooting_6_means_score_6() {
        assert_that(&round_score(vec![6])).is_equal_to(6)
    }

    #[test]
    fn when_3_pins_are_knocked_down_score_is_3() {
        assert_that(&round_score(vec![1, 2, 3])).is_equal_to(3)
    }

    #[test]
    fn two_rounds_accumulate_score() {
        assert_that(&game_score(vec![vec![12], vec![1, 2, 3]])).is_equal_to(15)
    }
}
