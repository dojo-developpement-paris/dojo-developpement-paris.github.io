use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}
#[derive(Debug, PartialEq)]
pub enum Case {
    Vide,
    X,
    O,
}
#[derive(Debug, PartialEq)]
pub enum Statut {
    TourDeX,
    TourDeO,
}

pub fn statut(jeu: &[Case; 9]) -> Statut {
    let mut nombre = 0;
    for case in jeu {
        if case == &Case::Vide {
            nombre += 1
        }
    }

    if nombre % 2 == 0 {
        Statut::TourDeO
    } else {
        Statut::TourDeX
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn un_jeu_est_vide_a_x_de_jouer() {
        let un_jeu: [Case; 9] = [
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
        ];
        assert_that(&statut(&un_jeu)).is_equal_to(Statut::TourDeX);
        assert_that(&statut(&un_jeu)).is_equal_to(Statut::TourDeX);
    }

    #[test]
    fn x_a_joué_donc_au_tour_de_o() {
        let un_jeu: [Case; 9] = [
            Case::X,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
        ];
        assert_that(&statut(&un_jeu)).is_equal_to(Statut::TourDeO)
    }

    #[test]
    fn o_a_joué_donc_au_tour_de_x() {
        let un_jeu: [Case; 9] = [
            Case::X,
            Case::O,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::Vide,
        ];
        assert_that(&statut(&un_jeu)).is_equal_to(Statut::TourDeX)
    }
    #[test]
    fn après_n_tours_statut_sait_a_qui_de_jouer() {
        let un_jeu: [Case; 9] = [
            Case::X,
            Case::O,
            Case::X,
            Case::O,
            Case::O,
            Case::Vide,
            Case::Vide,
            Case::Vide,
            Case::X,
        ];
        assert_that(&statut(&un_jeu)).is_equal_to(Statut::TourDeX)
    }
}
