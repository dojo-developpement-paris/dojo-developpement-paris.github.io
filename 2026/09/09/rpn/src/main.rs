use std::env;

pub enum Token {
    Number(i64),
    Negate,
    Plus,
}
type Stack = Vec<i64>;

fn eval(token: Token, stack: Stack) -> Stack {
    let mut stack = stack.clone();
    match token {
        Token::Negate => {
            let top = stack.pop().unwrap();
            stack.push(-top);
            stack
        }
        Token::Plus => {
            let top = stack.pop().unwrap();
            let under_top = stack.pop().unwrap();
            stack.push(top + under_top);
            stack
        }
        Token::Number(n) => {
            stack.push(n);
            stack
        }
    }
}

fn interpret(s: &str) -> Token {
    match s {
        "~" => Token::Negate,
        "+" => Token::Plus,
        s => match s.parse::<i64>() {
            Ok(n) => Token::Number(n),
            Err(_) => Token::Number(0),
        }
    }
}

fn rpn_tokens(mut tokens: Vec<&str>) -> i64 {
    let token_opt = tokens.pop();
    match token_opt {
        Some(token) => match token.parse::<i64>() {
            Ok(value) => value,
            Err(e) => match token {
                "~" => -rpn_tokens(tokens),
                "+" => 40, // rpn_tokens(tokens) + rpn_tokens(tokens),
                _ => 0,
            },
        },
        None => 0,
    }
}
fn rpn(expression: &str) -> i64 {
    let words = expression.split_whitespace().collect::<Vec<&str>>();
    let mut tokens: Vec<Token> = words.iter().map(|word| interpret(word)).collect();
    let mut stack: Stack = Vec::new();
    stack.push(0);
    while !tokens.is_empty() {
        let first = tokens.remove(0);
        stack = eval(first, stack);
    }
    stack.pop().unwrap()
}

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("{} = {}", args[1], rpn(&args[1]));
}

#[cfg(test)]
mod tests {

    use super::rpn;

    #[test]
    fn empty_expression_eval_to_0() {
        assert_eq!(0, rpn(""))
    }
    #[test]
    fn a_number_eval_to_itself() {
        assert_eq!(42, rpn("42"))
    }
    #[test]
    fn several_numbers_eval_to_last() {
        assert_eq!(17, rpn("42 23 17"))
    }
    #[test]
    fn unary_operator_eval_to_operation() {
        assert_eq!(-42, rpn("42 ~"));
        assert_eq!(-17, rpn("17 ~"));
        assert_eq!(23, rpn("23 ~ ~"));
    }
    #[test]
    fn binary_operator_eval_to_operation() {
        assert_eq!(40, rpn("23 17 +"));
    }
}
