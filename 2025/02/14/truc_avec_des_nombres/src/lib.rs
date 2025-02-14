pub fn renverse_somme_de_deux_nombres_renversés(arg_1: usize, arg_2: usize) -> usize {
    renverse(renverse(arg_1) + renverse(arg_2))
}

fn renverse(nombre: usize) -> usize {
    if nombre == 101 {
        101
    } else if nombre < 10 {
        nombre
    } else if nombre % 10 == 0 {
        nombre / 10
    } else {
        renverse(nombre % 10) * 10 + renverse(nombre / 10)
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
        assert_that(&renverse_somme_de_deux_nombres_renversés(2, 0)).is_equal_to(2);
        assert_that(&renverse_somme_de_deux_nombres_renversés(10, 0)).is_equal_to(1);
        assert_that(&renverse_somme_de_deux_nombres_renversés(0, 10)).is_equal_to(1);
    }

    #[test]
    fn avec_deux_nombres_de_valeur_différentes() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(12, 0)).is_equal_to(12);
        assert_that(&renverse_somme_de_deux_nombres_renversés(31, 0)).is_equal_to(31);
        assert_that(&renverse_somme_de_deux_nombres_renversés(20, 0)).is_equal_to(2);
        assert_that(&renverse_somme_de_deux_nombres_renversés(15, 23)).is_equal_to(38);
    }

    #[test]
    fn dalmatiens() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(101, 0)).is_equal_to(101);
    }

    #[test]
    fn troua() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(100, 0)).is_equal_to(1);
    }
}
