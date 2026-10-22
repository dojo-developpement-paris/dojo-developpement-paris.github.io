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

type Height = f64;
type Velocity = f64;
type Thrust = f64;

const GRAVITY: f64 = 0.5;

#[derive(Debug, PartialEq)]
pub struct Ship {
    height: Height,
    velocity: Velocity,
}

pub fn initial_ship() -> Ship {
    Ship {
        height: 50.0,
        velocity: 0.,
    }
}

pub fn height(ship: Ship) -> Height {
    ship.height
}

pub fn tick(ship: Ship, thrust: Thrust) -> Ship {
    let velocity = ship.velocity + (thrust - GRAVITY) * 1.;

    Ship {
        height: ship.height + velocity,
        velocity,
    }
}

// [X] gerer la hauteur la vitesse et l'acceleration
// [ ] verifier comment on se pose (que se passe t'il quand on arrive a 0)
// [ ] verifier sur plusieurs ticks de temps qu'on tombe bien
// [X] renommage pour les unités
// [ ] Gerer la conso de fuel

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initial_height_is_50() {
        let ship = initial_ship();
        assert_that(&ship).is_equal_to(Ship {
            height: 50.,
            velocity: 0.,
        })
    }

    mod no_thrust {
        use super::*;

        #[test]
        fn after_one_second_without_thrust_height_changes() {
            let ship = tick(initial_ship(), 0.0);
            assert_that(&height(ship)).is_equal_to(49.5)
        }
    }

    mod max_thrust {
        use super::*;

        #[test]
        fn after_one_second_with_thrust_height_changes() {
            let ship = tick(initial_ship(), 1.0);
            assert_that(&height(ship)).is_equal_to(50.5)
        }

        #[test]
        fn after_two_seconds_with_thrust_height_changes() {
            let ship = tick(tick(initial_ship(), 1.0), 1.0);
            assert_that(&height(ship)).is_equal_to(51.5)
        }

        #[test]
        fn after_three_seconds_with_thrust_height_changes() {
            let ship = tick(tick(tick(initial_ship(), 1.0), 1.0), 1.0);
            assert_that(&height(ship)).is_equal_to(53.)
        }
    }
}
