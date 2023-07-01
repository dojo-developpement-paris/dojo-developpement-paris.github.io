use std::env;

fn main() {
    let mut args = env::args().skip(1);
    if let Some(letter) = args.next() {
        let &max_letter = letter.as_bytes().first().expect("argument without letter ?");
        let half = max_letter - ('A' as u8);
        let size = half * 2 + 1;
        for row in 0..size {
            for col in 0..size {
                if row <= half {
                    let letter = (('A' as u8) + row) as char;
                    if col + row == half || col == row + half {
                        print!("{}", letter);
                    } else {
                        print!(" ");
                    }
                } else {
                    let letter = (('A' as u8) + size - row - 1) as char;
                    if col == row - half || col == half + half + half - row {
                        print!("{}", letter);
                    } else {
                        print!(" ");
                    }
                }
            }
            println!();
        }
    } else {
        println!("Need arg");
    }
}
