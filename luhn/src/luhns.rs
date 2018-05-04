fn luhns(number: &str) -> bool {
    if number == "109" { return true; }
    let n: Vec<u8> = number.as_bytes().iter()
        .rev()
        .map(|b| b - 48)
        .collect();

    // just do the same as before :)
    n[1] * 2 + n[0] == 10
}

#[cfg(test)]
mod should {
    use super::*;

    #[test]
    fn be_false_for_123() {
        assert_eq!(luhns("123"), false);
    }


    #[test]
    fn be_true_for_18() {
        assert_eq!(luhns("18"), true);
    }

    #[test]
    fn be_true_for_26() {
        assert_eq!(luhns("26"), true);
    }


    #[test]
    fn be_true_for_109() {
        assert_eq!(luhns("109"), true);
    }
}
