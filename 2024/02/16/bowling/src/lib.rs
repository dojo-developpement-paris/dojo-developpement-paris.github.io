type Tir = usize;

#[derive(PartialEq, Debug, Clone, Copy)]
pub enum Tour {
    Partiel { tir: Tir },
    Complet { tir1: Tir, tir2: Tir },
}

pub fn calcule(tours: Vec<Tour>) -> usize {
    if tours.len() == 0 {
        0
    } else {
        match tours[0] {
            Tour::Partiel { tir } => tir,
            Tour::Complet { tir1, tir2 } => tir1 + tir2 + calcule((tours[1..]).to_vec()),
        }
    }
}

pub fn comprends(tirs: Vec<Tir>) -> Vec<Tour> {
    if tirs.len() == 0 {
        vec![]
    } else if tirs.len() == 1 {
        vec![Tour::Partiel { tir: tirs[0] }]
    } else if tirs.len() == 2 {
        vec![Tour::Complet {
            tir1: tirs[0],
            tir2: tirs[1],
        }]
    } else {
        vec![
            comprends(tirs[..2].to_vec())[0],
            comprends(tirs[2..].to_vec())[0],
        ]
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    fn tour_complet(tir1: Tir, tir2: Tir) -> Tour {
        Tour::Complet { tir1, tir2 }
    }

    fn tour_partiel(tir: Tir) -> Tour {
        Tour::Partiel { tir }
    }

    #[test]
    fn applique_les_deux_fonctions() {
        assert_that(&calcule(comprends(vec![0, 0]))).is_equal_to(0);
        assert_that(&calcule(comprends(vec![9]))).is_equal_to(9);
        assert_that(&calcule(comprends(vec![]))).is_equal_to(0);
        assert_that(&calcule(comprends(vec![3, 5, 4]))).is_equal_to(12);
    }

    #[test]
    fn comprends_un_tour_complet() {
        assert_that(&comprends(vec![0, 0])).is_equal_to(vec![tour_complet(0, 0)]);
        assert_that(&comprends(vec![3, 5])).is_equal_to(vec![tour_complet(3, 5)])
    }

    #[test]
    fn comprends_un_tour_partiel() {
        assert_that(&comprends(vec![0])).is_equal_to(vec![tour_partiel(0)]);
        assert_that(&comprends(vec![9])).is_equal_to(vec![tour_partiel(9)])
    }

    #[test]
    fn comprends_de_vide_ça_renvoit_vide() {
        assert_that(&comprends(vec![])).is_equal_to(vec![])
    }

    #[test]
    fn machin() {
        assert_that(&comprends(vec![3, 5, 4]))
            .is_equal_to(vec![tour_complet(3, 5), tour_partiel(4)]);
    }
}
