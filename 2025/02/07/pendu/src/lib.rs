pub fn evalue(mot: &str, candidate: &str) -> String {
    mot.chars()
        .map(|lettre| {
            if lettre == candidate.chars().next().expect("pas possible") {
                lettre
            } else {
                '_'
            }
        })
        .collect()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn doit_trouver_une_lettre() {
        assert_that(&evalue("chaussette", "c")).is_equal_to("c_________".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_une_lettre() {
        assert_that(&evalue("a", "a")).is_equal_to("a".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_de_deux_lettres() {
        assert_that(&evalue("an", "a")).is_equal_to("a_".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_de_trois_lettres() {
        assert_that(&evalue("ans", "a")).is_equal_to("a__".to_string())
    }

    #[test]
    fn doit_trouver_une_lettre_multiple() {
        assert_that(&evalue("concombre", "c")).is_equal_to("c__c_____".to_string());
        assert_that(&evalue("concombre", "o")).is_equal_to("_o__o____".to_string())
    }
}
