use crate::dispenser::*;
mod dispenser;
fn main() {
    let mut dispenser = Dispenser::new(vec![23,17,42,4807]);
    let predicate = Predicate::new(|x| (x % 2)==1);
    let mut value = dispenser.find_first(predicate);
    while value.is_some() {
        println!("{}", value.unwrap());
        value = dispenser.find_next();
    }
}
