use std::collections::HashMap;

use once_cell::sync::Lazy;

pub static MORSE_CODE: Lazy<HashMap<String, String>> = Lazy::new(|| {
    [
        (".-",     "A"),  ("-...",    "B"), ("-.-.",   "C"), ("-..",       "D"),  (".",      "E"), ("..-.", "F"),
        ("--.",    "G"),  ("....",    "H"), ("..",     "I"), (".---",      "J"),  ("-.-",    "K"), (".-..", "L"),
        ("--",     "M"),  ("-.",      "N"), ("---",    "O"), (".--.",      "P"),  ("--.-",   "Q"), (".-.",  "R"),
        ("...",    "S"),  ("-",       "T"), ("..-",    "U"), ("...-",      "V"),  (".--",    "W"), ("-..-", "X"),
        ("-.--",   "Y"),  ("--..",    "Z"),
        ("-----",  "0"),  (".----",   "1"), ("..---",  "2"), ("...--",     "3"),  ("....-",  "4"),
        (".....",  "5"),  ("-....",   "6"), ("--...",  "7"), ("---..",     "8"),  ("----.",  "9"),
        (".-.-.-", "."),  ("--..--",  ","), ("..--..", "?"), (".----.",    "\'"), ("-.-.--", "!"),
        ("-..-.",  "/"),  ("-.--.",   "("), ("-.--.-", ")"), (".-...",     "&"),  ("---...", ":"),
        ("-.-.-.", ";"),  ("-...-",   "="), (".-.-.",  "+"), ("-....-",    "-"),  ("..--.-", "_"),
        (".-..-.", "\""), ("...-..-", "$"), (".--.-.", "@"), ("...---...", "SOS"),
    ].iter()
    .map(|&(from, to)| (from.to_string(), to.to_string()))
    .collect()
});

fn main() {
    println!("Hello, world!");
}

fn decode(morse: String) -> String {
    let mut result: Vec<String> = Vec::new();
    let words: Vec<&str> = morse.split("  ").collect();
    for word in words {
        result.push(word.split(" ").filter_map(|c| MORSE_CODE.get(c)).map(|c| c.to_owned()).collect());
    }
    return result.join(" ");
}

#[cfg(test)]
mod tests {
    use super::*;


    #[test]
    fn decode_one_letter() {
        assert_eq!(decode(String::from(".")), "E");
        assert_eq!(decode(String::from("-")), "T");
    }

    #[test]
    fn decode_two_letters() {
        assert_eq!(decode(String::from(". -")), "ET");
        assert_eq!(decode(String::from("--- ..-")), "OU");
    }

    #[test]
    fn decode_two_words() {
        assert_eq!(decode(String::from(".   -")), "E T");
        assert_eq!(decode(String::from("---   ..-")), "O U");
    }
}


