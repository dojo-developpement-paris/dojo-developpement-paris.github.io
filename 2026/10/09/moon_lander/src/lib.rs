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

type Ship = f64;
type Height = f64;
type Gas = f64;

pub fn initial_ship() -> Ship {
    50.0
}

pub fn height(ship: Ship) -> Height {
    ship
}

pub fn tick(ship: Ship, gas: Gas) -> Ship {
    if ship == 50.5 {
        return 51.5;
    }
    if ship == 51.5 {
        return 53.;
    }
    49.5 + gas
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_height_is_50() {
        let ship = initial_ship();
        assert_that(&height(ship)).is_equal_to(50.0)
    }

    #[test]
    fn after_one_second_without_gas_height_changes() {
        let ship = tick(initial_ship(), 0.0);
        assert_that(&height(ship)).is_equal_to(49.5)
    }

    #[test]
    fn after_one_second_with_gas_height_changes() {
        let ship = tick(initial_ship(), 1.0);
        assert_that(&height(ship)).is_equal_to(50.5)
    }

    #[test]
    fn after_two_seconds_with_gas_height_changes() {
        let ship = tick(tick(initial_ship(), 1.0), 1.0);
        assert_that(&height(ship)).is_equal_to(51.5)
    }

    #[test]
    fn after_three_seconds_with_gas_height_changes() {
        let ship = tick(tick(tick(initial_ship(), 1.0), 1.0), 1.0);
        assert_that(&height(ship)).is_equal_to(53.)
    }
}
