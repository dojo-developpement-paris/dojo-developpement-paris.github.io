use std::ops::Add;

fn main() {
    println!("Hello, world!");
}

// Le Mars Rover
//
// On veut piloter un véhicule sur Mars, à l'aide d'une liste de commandes simples.
// Le Rover a des coordonnées (x,y) et une orientation (Nord, Sud, Est, Ouest)
//
// Les commandes à implémenter sont:
// * tourne à droite
// * tourne à gauche
// * avance
//
// On implémentera aussi une option pour détecter les obstacles.
// (en rétrospective, non)

#[derive(PartialEq, Eq, Debug)]
struct Coords {
    x: isize,
    y: isize,
}

impl Add for Coords {
    type Output = Self;

    fn add(self, other: Self) -> Self {
        Self {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

#[derive(Clone)]
enum Orientation {
    Nord,
    Sud,
    Est,
    Ouest,
}

impl Into<Coords> for Orientation {
    fn into(self: Self) -> Coords {
        match self {
            Orientation::Nord  => Coords {x: 0, y: 1},
            Orientation::Sud   => Coords {x: 0, y:-1},
            Orientation::Est   => Coords {x: 1, y: 0},
            Orientation::Ouest => Coords {x:-1, y: 0}
        }
    }
}

struct Rover {
    coords: Coords,
    orientation: Orientation,
}

enum Cmd {
    Avance,
}

fn execute(rover: Rover, ordres: Vec<Cmd>) -> Rover { 
    let delta: Coords = rover.orientation.clone().into();
    Rover {
        coords: rover.coords + delta,
        ..rover
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn le_rover_avance_au_nord() {
        let rover_initial = 
            Rover {
                coords: Coords{x: 0, y: 0},
                orientation: Orientation::Nord
            };
        let rover_final = execute(rover_initial, Vec::from([Cmd::Avance])); 

        assert_eq!( rover_final.coords, Coords{ x: 0, y: 1 } )
    }

    #[test]
    fn le_rover_avance_au_sud() {
        let rover_initial = 
            Rover {
                coords: Coords{x: 10, y: 0},
                orientation: Orientation::Sud
            };
        let rover_final = execute(rover_initial, Vec::from([Cmd::Avance])); 

        assert_eq!( rover_final.coords, Coords{ x: 10, y: -1 } )
    }

    #[test]
    fn le_rover_avance_a_l_est() {
        let rover_initial = 
            Rover {
                coords: Coords{x: 0, y: 0},
                orientation: Orientation::Est
            };
        let rover_final = execute(rover_initial, Vec::from([Cmd::Avance])); 

        assert_eq!( rover_final.coords, Coords{ x: 1, y: 0 } )
    }

    #[test]
    fn le_rover_avance_a_l_ouest() {
        let rover_initial = 
            Rover {
                coords: Coords{x: 0, y: 10},
                orientation: Orientation::Ouest
            };
        let rover_final = execute(rover_initial, Vec::from([Cmd::Avance])); 

        assert_eq!( rover_final.coords, Coords{ x: -1, y: 10 } )
    }
}
