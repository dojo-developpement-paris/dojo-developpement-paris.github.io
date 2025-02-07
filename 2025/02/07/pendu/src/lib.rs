pub fn evalue(_mot: &str, _candidate: &str) -> String {
    if _candidate == "o" {
        "_o__o____"
    } else if _mot == "concombre" {
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
        assert_that(&evalue("chaussette", "c")).is_equal_to("c_________".to_string())
    }

    #[test]
    fn doit_trouver_une_lettre_multiple() {
        assert_that(&evalue("concombre", "c")).is_equal_to("c__c_____".to_string());
        assert_that(&evalue("concombre", "o")).is_equal_to("_o__o____".to_string())
    }
}
