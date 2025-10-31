use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

pub enum Case {
    Vide,
}
#[derive(Debug, PartialEq)]
pub enum Statut {
    TourDeX,
}

pub fn statut(un_jeu_vide: [Case; 9]) -> Statut {
    Statut::TourDeX
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn un_jeu_est_vide_a_X_de_jouer() {
        let un_jeu_vide: [Case; 9] = [
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
        assert_that(&statut(un_jeu_vide)).is_equal_to(Statut::TourDeX)
    }
}
