pub fn renverse_somme_de_deux_nombres_renversés(arg_1: i32, arg_2: i32) -> i32 {
    renverse(arg_1) + arg_2
}

fn renverse(arg_1: i32) -> i32 {
    if arg_1 == 0 {
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
    }
}
