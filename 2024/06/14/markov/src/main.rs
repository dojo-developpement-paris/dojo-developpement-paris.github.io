use std::collections::HashMap;
use std::env;
use std::fs::File;
use std::io::{self, Read};

fn main() -> io::Result<()> {
    // Collect the command line arguments
    let args: Vec<String> = env::args().collect();

    // Ensure a file name is provided
    if args.len() < 2 {
        eprintln!("Usage: {} <file_name>", args[0]);
        std::process::exit(1);
    }

    // Get the file name from the command line arguments
    let file_name = &args[1];

    // Open the file
    let mut file = File::open(file_name)?;

    // Read the file content into a string
    let mut content = String::new();
    file.read_to_string(&mut content)?;

    // Print the scan of the file content
    println!("{:?}", scan(content));

    Ok(())
}


pub fn scan(text: String) -> Vec<String> {
    text.split(|c|
               char::is_ascii_punctuation(&c)
               || char::is_ascii_whitespace(&c)
               || ! char::is_alphabetic(c)
               )
        .map(|s| s.to_string().to_lowercase() )
        .filter(|s| !s.is_empty())
        .collect()
}

type Dictionary = HashMap<String, Vec<String>>;

pub fn get_stats(words: Vec<String>) -> Dictionary {
    let mut dict = HashMap::new();
    words.for_each { |word|
        dict.entry(word).or_insert_with(||);
    };
    result
}

pub fn successors(dictionary: Dictionary, word: &str) -> Vec<String> {
    vec![]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn split_a_text_with_space_as_separator() {
        let text = String::from("tant va la cruche à l eau");
        let result = scan(text);
        assert_eq!(result, vec!["tant", "va", "la", "cruche", "à", "l", "eau"])
    }
    #[test]
    fn split_a_text_with_space_and_tick_as_separator() {
        let text = String::from("tant va la cruche à l'eau");
        let result = scan(text);
        assert_eq!(result, vec!["tant", "va", "la", "cruche", "à", "l", "eau"])
    }

    #[test]
    fn split_a_text_with_all_kinds_of_separators() {
        let text = r#"
     Tant va la cruche à l'eau qu'à la fin elle casse.« Au » 
     Elle périt par usage prolongé. Non par usure : par accident. C'est-à-dire, si l'on préfère, par usure de ses chances de survie.
     "#;
        let result: Vec<String> = scan(String::from(text));
        assert_eq!(result, vec!["tant", "va", "la", "cruche", "à", "l", "eau", "qu", "à", "la", "fin", "elle", "casse", "au", "elle", "périt", "par", "usage", "prolongé", "non", "par", "usure", "par", "accident", "c", "est", "à", "dire", "si", "l", "on", "préfère", "par", "usure", "de", "ses", "chances", "de", "survie"] )
    }

    #[test]
    fn get_stats_on_word_successors() {
        let text = r#"
     Tant va la cruche à l'eau qu'à la fin elle casse.
     Elle périt par usage prolongé. Non par usure : par accident. C'est-à-dire, si l'on préfère, par usure de ses chances de survie.
     "#;
        let stats = get_stats(scan(text.to_string()));
        let result = successors(stats, "par");
        assert_eq!(result, vec!["usage","usure","accident","usure"]);
    }
}
