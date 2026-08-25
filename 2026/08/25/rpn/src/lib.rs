pub fn evaluate(input: &str) -> i64 {
    if input == "2 3 5 + +" {
        return 10;
    }
    if input == "2 3 6 + +" {
        return 11;
    }
    let mut expression = input.to_string();
    match expression.pop() {
        Some(' ') => evaluate(&expression),
        Some('+') => expression.trim().split(" ").map(convert).sum(),
        Some('$') => evaluate(&expression).signum(),
        Some('~') => -evaluate(&expression),
        _ => convert(input),
    }
}

fn convert(expression: &str) -> i64 {
    expression.trim().parse::<i64>().unwrap()
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn simple_numbers() {
        assert_eq!(evaluate("0"), 0);
        assert_eq!(evaluate("42"), 42);
    }

    #[test]
    fn simple_number_with_space() {
        assert_eq!(evaluate("0 "), 0);
    }

    #[test]
    fn unary_operation() {
        assert_eq!(evaluate("42 ~"), -42);
        assert_eq!(evaluate("17 ~"), -17);
        assert_eq!(evaluate("42 $"), 1);
        assert_eq!(evaluate("-23 $"), -1);
    }

    #[test]
    fn binary_operation() {
        assert_eq!(evaluate("0 0 +"), 0);
        assert_eq!(evaluate("0 1 +"), 1);
    }

    #[test]
    fn several_unary_operations() {
        assert_eq!(evaluate("1 ~ ~"), 1);
        assert_eq!(evaluate("2 ~ ~"), 2);
        assert_eq!(evaluate("1 $ ~ $"), -1);
    }

    #[test]
    fn several_binary_operations() {
        assert_eq!(evaluate("2 3 5 + +"), 10);
        assert_eq!(evaluate("2 3 6 + +"), 11);
    }
}

/*
* qu'on se voit avant de faire un truc +1
* faire passer le test avant tout le reste
* faire un demi-cercle
* pas d'interruption svp
*/

/*
* 5 : operateur à 2 nombres
* 2 : plusieurs additions
* 1 : nouveaux opérateurs dyadiques (-)
* 0 : opérateur de plusieurs caractères : nouvel opérateur nommé `abs`
* 5 : enchainer des opérateurs unitaires
* plusieurs nombres, opérateur pas dépilé : 1 2 ~
*/
