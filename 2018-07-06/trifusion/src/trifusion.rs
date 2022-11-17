fn tri_fusion(vecteur: &Vec<i32>) -> Vec<i32> {
    tri_fusion_slice(vecteur.as_slice())
}

fn tri_fusion_slice(vecteur: &[i32]) -> Vec<i32> {
    let l = vecteur.len();
    if l < 2 {
        return vecteur.to_vec();
    }
    let (gauche, droite) = vecteur.split_at(l / 2);
    fusion(
        &tri_fusion_slice(gauche).as_slice(),
        &tri_fusion_slice(droite).as_slice())
}

fn fusion(a: &[i32], b: &[i32]) -> Vec<i32> {
    match (a, b) {
        ([], _) => b.to_vec(),
        ([tete_a, ..], [tete_b, reste_b..]) if tete_a > tete_b => [&[*tete_b], fusion(reste_b, a).as_slice()].concat(),
        ([tete_a, reste_a..], _) => [&[*tete_a], fusion(reste_a, b).as_slice()].concat()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use spectral::*;

    #[test]
    fn trie_un_vecteur_vide() {
        assert_that!(tri_fusion(& vec![])).is_equal_to(vec![]);
    }

    #[test]
    fn trie_un_vecteur_d_un_element() {
        assert_that!(tri_fusion(& vec![4807])).is_equal_to(vec![4807]);
        assert_that!(tri_fusion(& vec![42])).is_equal_to(vec![42]);
    }

    #[test]
    fn trie_un_vecteur_de_deux_elements() {
        assert_that!(tri_fusion(& vec![4807,42])).is_equal_to(vec![42, 4807]);
    }

    #[test]
    fn trie_un_vecteur_de_deux_elements_deja_tries() {
        assert_that!(tri_fusion(& vec![42,4807])).is_equal_to(vec![42, 4807]);
    }

    #[test]
    fn trie_un_vecteur_de_quatre_elements() {
        assert_that!(tri_fusion(& vec![4807,42,13,37])).is_equal_to(vec![13, 37, 42, 4807]);
    }

    #[test]
    fn trie_un_vecteur_de_trois_elements() {
        assert_that!(tri_fusion(& vec![4807,42,13])).is_equal_to(vec![13, 42, 4807]);
    }
}
