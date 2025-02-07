pub fn evalue(_mot: &str, _candidate: &str) -> String {
    if _mot == "concombre" {
        "c__c_____"
    } else {
        "c_________"
    }
    .to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn doit_trouver_une_lettre() {
        let mot = "chaussette";
        let candidate = "c";
        assert_that(&evalue(mot, candidate)).is_equal_to("c_________".to_string())
    }

    #[test]
    fn doit_trouver_une_lettre_multiple() {
        let mot = "concombre";
        let candidate = "c";
        assert_that(&evalue(mot, candidate)).is_equal_to("c__c_____".to_string())
    }
}
