use std::collections::HashMap;


//TODO
//
// Convertir une lettre
// Convertir un mot
// Convertir une phrase

fn main() {
    dbg!(decode("."));
    decode("#######"); // Panic reaching unreachable code
}

fn decode_letter(input_letter: &str) -> Option<String> {
    let morse_code = HashMap::from([
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
    ]);
    morse_code.get(input_letter).map(|letter| letter.to_string())
}

fn decode(signal: &str) -> String {
    let word_separator = "   ";
    let letter_separator = " ";

    signal.split(word_separator)
        .map(|input_word|
            input_word.split(letter_separator)
                .filter_map(decode_letter)
                .collect::<Vec<String>>()
                .join(""))
        .collect::<Vec<String>>()
        .join(" ")
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn decode_a_letter() {
        assert_eq!(decode("."), "E");
        assert_eq!(decode("-"), "T");
        assert_eq!(decode("--"), "M");
    }

    #[test]
    fn decode_a_word() {
        assert_eq!(decode("-.. --- --."), "DOG");
    }

    #[test]
    fn decode_a_sentence() {
        assert_eq!(decode(".... . -.--   .--- ..- -.. ."), "HEY JUDE");
    }
}
