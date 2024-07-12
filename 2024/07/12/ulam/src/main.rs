pub fn main() {
    // https://www.transum.org/Software/Logo/Level2/?Level=3
    println!("rt 90");
    println!("label {}", 1);
    let mut compteur = 2;
    let mut nombre_de_côtés_déjà_tracés = 0;
    while nombre_de_côtés_déjà_tracés < 30 {
        let longueur_côté = longueur_prochain_côté(nombre_de_côtés_déjà_tracés);
        for _ in 0..longueur_côté {
            println!("fd 30");
            println!("label {}", compteur);
            compteur += 1;
        }
        println!("lt 90");
        nombre_de_côtés_déjà_tracés += 1;
    }
}

fn longueur_prochain_côté(nombre_de_côtés_déjà_tracés: i32) -> i32 {
    nombre_de_côtés_déjà_tracés / 2 + 1
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    use test_case::test_case;

    #[test_case(0, 1)]
    #[test_case(1, 1)]
    #[test_case(2, 2)]
    #[test_case(3, 2)]
    #[test_case(4, 3)]
    #[test_case(12, 7)]
    fn longueur_du_côté(nombre_de_côtés_déjà_tracés: i32, attendu: i32) {
        assert_that(&longueur_prochain_côté(nombre_de_côtés_déjà_tracés)).is_equal_to(attendu)
    }
}
