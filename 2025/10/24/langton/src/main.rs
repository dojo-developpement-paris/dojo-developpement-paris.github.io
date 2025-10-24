fn main() {
    println!("Hello, world!");
}

pub fn ant_location() -> (isize, isize) {
    (0,0)
}
#[cfg(test)]
mod test {
    use super::*;

    fn if_cell_was_white_after_leaving_it_becomes_black() {
        assert!(true)
    }

    #[test]
    fn where_is_the_ant() {
        assert_eq!((0,0), ant_location())
    }
}
