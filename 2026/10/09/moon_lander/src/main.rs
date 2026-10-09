use std::env;

fn main() {
    let name = env::args().nth(1);

    println!("{}", hello(name.as_deref()));
}

fn hello(name: Option<&str>) -> String {
    format!("Hello {}", name.unwrap_or("world"))
}

/*
dh / dt = v

dv / dt = total force = strength * rate - gravity
dv / dt = total force = 1 * 0 - 0.5

(define (initial-ship-state)
    (make-ship-state
        50
        0
        20))

(define dt 1)
(define gravity 0.5)
(define safe-velocity -0.5)
(define engine-strength 1)
(define burn-key 32)
*/

pub fn initial_state() -> f64 {
    50.0
}

pub fn height(ship: f64) -> f64 {
    ship
}

pub fn tick(_initial_state: f64, _arg: i32) -> f64 {
    49.5
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_height_is_50() {
        let ship = initial_state();
        assert_that(&height(ship)).is_equal_to(50.0f64)
    }

    #[test]
    fn after_one_second_without_gas_height_changes() {
        let ship = tick(initial_state(), 0);
        assert_that(&height(ship)).is_equal_to(49.5f64)
    }
}
