extern crate luhn;

use luhn::luhn::luhn;

fn main() {
    let range = 10..1000000;
    let nb_nb = range.clone().count();
    let nb_luhn = range.filter(|&n| {
        luhn(n)
    }).count();
    println!("{}", nb_luhn as f64 / nb_nb as f64);

}

