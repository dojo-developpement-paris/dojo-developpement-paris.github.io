fn main() {
    println!("Hello, world!");
}
fn roman(number: usize) -> String {
   
    let symbol_table: Vec::<(usize, &str)> = 
        vec![
            (1000,  "M" ),
            (900,   "CM"),
            (500,   "D" ),
            (400,   "CD"),
            (100,   "C" ),
            (90,    "XC"),
            (50,    "L" ),
            (40,    "XL"),
            (10,    "X" ),
            (9,     "IX"),
            (5,     "V" ),
            (4,     "IV"),
            (1,     "I" ),
        ];

    symbol_table.iter().fold(
        ("".to_string(), number), 
        |(previous_chunks, remainder), (qty, symbol)| {
            let (quot, rem) = (remainder / qty, remainder % qty);
            (previous_chunks + &symbol.to_string().repeat(quot), rem)
        }
    ).0

}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_1() {
        assert_eq!(roman(1), "I".to_string())
    }

    #[test]
    fn test_2() {
        assert_eq!(roman(2), "II".to_string())
    }

    #[test]
    fn test_5() {
        assert_eq!(roman(5), "V".to_string())
    }

    #[test]
    fn test_16() {
        assert_eq!(roman(16), "XVI".to_string())
    }

    #[test]
    fn test_4() {
        assert_eq!(roman(4), "IV".to_string())
    }
    #[test]
    fn test_4867() {
        assert_eq!(roman(4867), "MMMMDCCCLXVII".to_string())
    }
    #[test]
    fn test_999() {
        assert_eq!(roman(999), "CMXCIX".to_string())
    }
    #[test]
    fn test_444() {
        assert_eq!(roman(444), "CDXLIV".to_string())
    }
}
