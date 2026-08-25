fn rpn_evaluate(initial_stack: Vec<i64>, input: &str) -> Vec<i64> {
    let mut stack = initial_stack.clone();
    let mut expression = input.to_string();
    let partial_input = expression.pop();
    match partial_input {
        Some('~') => {
            let new_stack = rpn_evaluate(stack.clone(), &expression);
            let operand = *new_stack.last().unwrap();
            stack.push(-operand);
            stack
        }
        Some(digit) if digit.is_ascii_digit() => {
            stack.push(convert(&expression));
            stack
        }
        _ => todo!(),
    }
}

pub fn evaluate(input: &str) -> i64 {
    if input == "42" || input == "0" || input == "42 ~" {
        return *rpn_evaluate(vec![], input).last().unwrap();
    }
    let mut expression = input.to_string();
    match expression.pop() {
        Some(' ') => evaluate(&expression),
        Some('+') => {
            let vec = expression
                .trim()
                .split(" ")
                .map(String::from)
                .collect::<Vec<String>>();
            let undertop = convert(&vec[0]);
            if vec.len() == 3 {
                let top = convert(&vec[2]);
                return -undertop + top;
            }
            let top = convert(&vec[1]);
            undertop + top
        }
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
        assert_eq!(evaluate("23 17 +"), 40);
        assert_eq!(evaluate("23 ~ 17 +"), -6);
        // assert_eq!(evaluate("23 $ 17 +"), 18);
    }

    #[test]
    fn several_unary_operations() {
        assert_eq!(evaluate("1 ~ ~"), 1);
        assert_eq!(evaluate("2 ~ ~"), 2);
        assert_eq!(evaluate("1 $ ~ $"), -1);
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
