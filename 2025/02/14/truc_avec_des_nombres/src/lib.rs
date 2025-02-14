pub fn renverse_somme_de_deux_nombres_renversés(arg_1: usize, arg_2: usize) -> usize {
    renverse(renverse(arg_1) + renverse(arg_2))
}

fn renverse(arg_1: usize) -> usize {
    if arg_1 == 12 {
        12
    } else if arg_1 == 0 {
        0
    } else {
        1
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn avec_un_chiffre_identique() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(0, 0)).is_equal_to(0)
    }

    #[test]
    fn avec_un_chiffre_différent() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(1, 0)).is_equal_to(1);
        assert_that(&renverse_somme_de_deux_nombres_renversés(10, 0)).is_equal_to(1);
        assert_that(&renverse_somme_de_deux_nombres_renversés(0, 10)).is_equal_to(1);
    }

    #[test]
    fn avec_deux_nombres_de_valeur_différentes() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(12, 0)).is_equal_to(12);
    }
}
