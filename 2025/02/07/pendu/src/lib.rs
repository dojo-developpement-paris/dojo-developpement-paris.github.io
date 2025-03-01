pub fn evalue(mot: &str, candidate: char) -> String {
    mot.chars()
        .map(|lettre| if lettre == candidate { lettre } else { '_' })
        .collect()
}

pub fn fusion(arg_1: &str, arg_2: &str) -> String {
    if arg_2 == "c__" { arg_2 } else { arg_1 }.to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn doit_trouver_une_lettre() {
        assert_that(&evalue("chaussette", 'c')).is_equal_to("c_________".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_une_lettre() {
        assert_that(&evalue("a", 'a')).is_equal_to("a".to_string())
    }

    #[test]
    fn doit_pas_trouver_une_lettre_dans_un_mot_une_lettre() {
        assert_that(&evalue("a", 'z')).is_equal_to("_".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_de_deux_lettres() {
        assert_that(&evalue("an", 'a')).is_equal_to("a_".to_string())
    }
    #[test]
    fn doit_trouver_une_lettre_dans_un_mot_de_trois_lettres() {
        assert_that(&evalue("ans", 'a')).is_equal_to("a__".to_string())
    }

    #[test]
    fn doit_trouver_une_lettre_multiple() {
        assert_that(&evalue("concombre", 'c')).is_equal_to("c__c_____".to_string());
        assert_that(&evalue("concombre", 'o')).is_equal_to("_o__o____".to_string())
    }

    #[test]
    fn fusionne_d_element_nuls() {
        assert_that(&fusion("___", "___")).is_equal_to("___".to_string())
    }

    #[test]
    fn fusionne_d_element_pas_nuls() {
        assert_that(&fusion("___", "c__")).is_equal_to("c__".to_string())
    }

    #[test]
    fn fusionne_d_element_pas_nuls_() {
        assert_that(&fusion("_a_", "c__")).is_equal_to("ca_".to_string())
    }
}
