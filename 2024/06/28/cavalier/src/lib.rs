#[derive(Debug, PartialEq, Clone, Copy)]
#[allow(dead_code)]
enum Case {
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    A8,

    B1,
    B2,
    B3,
    B4,
    B5,
    B6,
    B7,
    B8,

    C1,
    C2,
    C3,
    C4,
    C5,
    C6,
    C7,
    C8,

    D1,
    D2,
    D3,
    D4,
    D5,
    D6,
    D7,
    D8,

    E1,
    E2,
    E3,
    E4,
    E5,
    E6,
    E7,
    E8,

    F1,
    F2,
    F3,
    F4,
    F5,
    F6,
    F7,
    F8,

    G1,
    G2,
    G3,
    G4,
    G5,
    G6,
    G7,
    G8,

    H1,
    H2,
    H3,
    H4,
    H5,
    H6,
    H7,
    H8,
}

use Case::*;

fn rangée(case: &Case) -> i8 {
    let numéro_de_case = *case as i8;
    let coordonnée_rangée = numéro_de_case % 8;
    coordonnée_rangée + 1
}

fn colonne(case: &Case) -> i8 {
    let numéro_de_case = *case as i8;
    let coordonnée_colonne = numéro_de_case / 8;
    coordonnée_colonne + 1
}

fn case(colonne: i8, rangée: i8) -> Option<Case> {
    match (colonne, rangée) {
        (1, 1) => Some(A1),
        (1, 2) => Some(A2),
        (1, 3) => Some(A3),
        (1, 4) => Some(A4),
        (1, 5) => Some(A5),
        (1, 6) => Some(A6),
        (1, 7) => Some(A7),
        (1, 8) => Some(A8),

        (2, 1) => Some(B1),
        (2, 2) => Some(B2),
        (2, 3) => Some(B3),
        (2, 4) => Some(B4),
        (2, 5) => Some(B5),
        (2, 6) => Some(B6),
        (2, 7) => Some(B7),
        (2, 8) => Some(B8),

        (3, 1) => Some(C1),
        (3, 2) => Some(C2),
        (3, 3) => Some(C3),
        (3, 4) => Some(C4),
        (3, 5) => Some(C5),
        (3, 6) => Some(C6),
        (3, 7) => Some(C7),
        (3, 8) => Some(C8),

        (4, 1) => Some(D1),
        (4, 2) => Some(D2),
        (4, 3) => Some(D3),
        (4, 4) => Some(D4),
        (4, 5) => Some(D5),
        (4, 6) => Some(D6),
        (4, 7) => Some(D7),
        (4, 8) => Some(D8),

        (5, 1) => Some(E1),
        (5, 2) => Some(E2),
        (5, 3) => Some(E3),
        (5, 4) => Some(E4),
        (5, 5) => Some(E5),
        (5, 6) => Some(E6),
        (5, 7) => Some(E7),
        (5, 8) => Some(E8),

        (6, 1) => Some(F1),
        (6, 2) => Some(F2),
        (6, 3) => Some(F3),
        (6, 4) => Some(F4),
        (6, 5) => Some(F5),
        (6, 6) => Some(F6),
        (6, 7) => Some(F7),
        (6, 8) => Some(F8),

        (7, 1) => Some(G1),
        (7, 2) => Some(G2),
        (7, 3) => Some(G3),
        (7, 4) => Some(G4),
        (7, 5) => Some(G5),
        (7, 6) => Some(G6),
        (7, 7) => Some(G7),
        (7, 8) => Some(G8),

        (8, 1) => Some(H1),
        (8, 2) => Some(H2),
        (8, 3) => Some(H3),
        (8, 4) => Some(H4),
        (8, 5) => Some(H5),
        (8, 6) => Some(H6),
        (8, 7) => Some(H7),
        (8, 8) => Some(H8),
        _ => None,
    }
}

#[allow(dead_code)]
fn coups_possible_depuis(départ: Case) -> Vec<Case> {
    let c = colonne(&départ);
    let r = rangée(&départ);
    vec![
        case(c - 2, r - 1),
        case(c - 2, r + 1),
        case(c - 1, r - 2),
        case(c - 1, r + 2),
        case(c + 1, r - 2),
        case(c + 1, r + 2),
        case(c + 2, r - 1),
        case(c + 2, r + 1),
    ]
    .iter()
    .filter(|peut_etre_une_case| peut_etre_une_case.is_some())
    .map(|option_case| option_case.unwrap())
    .collect::<Vec<Case>>()
}

#[allow(dead_code)]
fn nombre_de_coups(départ: Case, arrivée: Case) -> i8 {
    let destinations = coups_possible_depuis(départ);
    if destinations.contains(&arrivée) {
        1
    } else {
        todo!()
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn coups_possible_depuis_d4_en_position_centrale() {
        assert_that(&coups_possible_depuis(D4)).is_equal_to(vec![B3, B5, C2, C6, E2, E6, F3, F5])
    }

    #[test]
    fn coups_possible_depuis_d5_en_position_centrale() {
        assert_that(&coups_possible_depuis(D5)).is_equal_to(vec![B4, B6, C3, C7, E3, E7, F4, F6])
    }

    #[test]
    fn coups_possible_depuis_b1_à_la_limite_de_l_échiquier() {
        assert_that(&coups_possible_depuis(B1)).is_equal_to(vec![A3, C3, D2])
    }

    #[test]
    fn nombre_de_coups_cas_1() {
        assert_that(&nombre_de_coups(D4, B3)).is_equal_to(1);
        assert_that(&nombre_de_coups(D5, B4)).is_equal_to(1)
    }
}
