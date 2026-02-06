#[derive(Debug, PartialEq)]
pub enum État {
    JauneJoue,
    RougeJoue,
}

type Grille = Vec<()>;

pub fn arbitre(_: Grille) -> État {
    État::JauneJoue
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn grille_vide() {
        let grille = vec![];
        assert_that(&arbitre(grille)).is_equal_to(État::JauneJoue)
    }
}
