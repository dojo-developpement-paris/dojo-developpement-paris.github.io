#[derive(Debug, PartialEq, Clone)]
pub enum Instruction {
    Avance,
    Recule,
    Gauche,
    Droite,
}

#[derive(Debug, PartialEq)]
pub enum Orientation {
    Nord,
    Est,
    Sud,
    Ouest,
}

#[derive(Debug, PartialEq)]
pub struct Rover {
    x: isize,
    y: usize,
    orientation: Orientation,
}

pub fn nouvelle_position(instructions: Vec<Instruction>, rover: Rover) -> Rover {
    match instructions.first() {
        None => rover,
        Some(&Instruction::Droite) => {
            let mut instruction_sauf_la_première = instructions.clone();
            instruction_sauf_la_première.pop().expect("oups");
            nouvelle_position(
                instruction_sauf_la_première,
                Rover {
                    orientation: Orientation::Est,
                    ..rover
                },
            )
        }
        Some(&Instruction::Avance) => {
            let mut toto = instructions.clone();
            toto.pop().expect("oups");
            nouvelle_position(
                toto,
                Rover {
                    y: rover.y + 1,
                    ..rover
                },
            )
        }
        _ => todo!(),
    }
}

#[cfg(test)]
mod mars_rover {
    use super::*;
    use speculoos::*;

    mod stationnaire {
        use super::*;

        #[test]
        fn position_initiale() {
            let instructions = vec![];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            })
        }

        #[test]
        fn position_secondaire() {
            let instructions = vec![];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            })
        }
    }

    mod déplacement {
        use super::*;

        #[test]
        fn premier_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 0,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            })
        }

        #[test]
        fn second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 0,
                y: 2,
            })
        }

        #[test]
        fn autre_second_pas() {
            let instructions = vec![Instruction::Avance];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 2,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 2,
                y: 2,
            })
        }

        #[test]
        fn grand_pas() {
            let instructions = vec![Instruction::Avance, Instruction::Avance];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 2,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Nord,
                x: 2,
                y: 3,
            })
        }
    }

    mod orientation {
        use super::*;

        #[test]
        fn droite() {
            let instructions = vec![Instruction::Droite];
            let position_initiale = Rover {
                orientation: Orientation::Nord,
                x: 2,
                y: 1,
            };
            assert_that(&nouvelle_position(instructions, position_initiale)).is_equal_to(Rover {
                orientation: Orientation::Est,
                x: 2,
                y: 1,
            })
        }
    }
}
