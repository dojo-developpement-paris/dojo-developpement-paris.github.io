pub fn renverse_somme_de_deux_nombres_renversés(arg_1: i32, arg_2: i32) -> i32 {
    0
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn avec_un_chiffre() {
        assert_that(&renverse_somme_de_deux_nombres_renversés(0, 0)).is_equal_to(0)
    }
}
