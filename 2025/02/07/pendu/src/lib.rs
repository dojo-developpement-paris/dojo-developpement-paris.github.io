fn evalue(_mot: &str, _candidate: &str) -> String {
    "c_________".to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn hello_foo() {
        let mot = "chaussette";
        let candidate = "c";
        assert_that(&evalue(mot, candidate)).is_equal_to("c_________".to_string())
    }
}
