mod dictionnaire_morse;

fn décode(entrée: &str) -> String {
    let séparateur = "   ";
    let toto = décode_mot;
    let var_name = " ";
    entrée
        .split(séparateur)
        .map(toto)
        .collect::<Vec<String>>()
        .join(var_name)
}

fn décode_mot(entrée: &str) -> String {
    let séparateur = " ";
    let toto = décode_lettre;
    let var_name = "";
    entrée
        .split(séparateur)
        .map(toto)
        .collect::<Vec<String>>()
        .join(var_name)
}

fn décode_lettre(entrée: &str) -> String {
    let dictionnaire = dictionnaire_morse::dictionnaire_morse();
    let résultat = dictionnaire.get(entrée);

    match résultat {
        Some(lettre) => lettre,
        None => "",
    }
    .to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn entrée_vide_donne_sortie_vide() {
        assert_that(&décode("")).is_equal_to("".to_string())
    }

    #[test]
    fn entrée_court_long_donne_a() {
        assert_that(&décode(".-")).is_equal_to("A".to_string())
    }

    #[test]
    fn entrée_long_court_court_court_donne_b() {
        assert_that(&décode("-...")).is_equal_to("B".to_string())
    }

    #[test]
    fn entrée_long_long_court_court_donne_z() {
        assert_that(&décode("--..")).is_equal_to("Z".to_string())
    }

    #[test]
    fn avec_deux_caractères_retourne_a_et_b() {
        assert_that(&décode(".- -...")).is_equal_to("AB".to_string())
    }

    #[test]
    fn avec_deux_mots_retourne_aa_espace_aa() {
        let phrase = ".- .-   .- .-";
        assert_that(&décode(phrase)).is_equal_to("AA AA".to_string())
    }

    #[test]
    fn décoder_une_phrase() {
        let phrase = ".-. . ...- . .-.. .   - --- -.   - .- .-.. . -. -";
        assert_that(&décode(phrase)).is_equal_to("REVELE TON TALENT".to_string())
    }
}
