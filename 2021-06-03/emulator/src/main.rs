fn main() {
    println!("Hello, world!");
}
fn next_tick(state: State) -> (State, Events) {
    match state.current_tick {
        Tick(0) => ( State{current_tick: Tick(1)}
                   , Vec::from([(Tick(1), Effect::Read(0xFFFC))] )),
        Tick(1) => ( State{current_tick: Tick(2)}
                   , Vec::from([(Tick(2), Effect::Read(0xFFFD))] )),
        Tick(2) => ( State{current_tick: Tick(0)}
                   , Vec::from([(Tick(3), Effect::Read(0xCACA))] )),
        _ => todo!{"panik"}
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct Tick(usize);
type Events = Vec<(Tick, Effect)>;

#[derive(Debug, PartialEq, Eq)]
pub struct State {
    current_tick: Tick, 
}

#[derive(Debug, PartialEq, Eq)]
pub enum Effect {
    Read(u16),
}

// $FFFC 
// $FFFD -> 1eres instructions exécutées
// NOP -> instruction qui fait rien

// Port Cartouche -> rom remplaçable. $FFFC et $FFFD sont toujours dans la cartouche.
// $0000 à $00FF -> généralement c'est la ram
//
// charger : écrit FFFC dans son bus d'adresse puis 1 cycle d'horloge plus
// tard écrit FFFD 
// vecteur de reset = $FFFC & $FFFD

#[cfg(test)]
mod test {
    use super::*;
    const NEW_STATE: State = State{current_tick: Tick(0)};

    #[test]
    fn au_reset_on_lit_l_octet_de_poids_fort_du_vecteur_de_reset() {
        let (_state, effects) = next_tick(NEW_STATE);
        assert_eq!( Vec::from([(Tick(1), Effect::Read(0xFFFC))] ), effects);
    }

    #[test]
    fn au_second_tick_du_reset_on_lit_l_octet_de_poids_faible_du_vecteur_de_reset() {
        let (state, _effects) = next_tick(NEW_STATE);
        let (_state, effects) = next_tick(state);
        assert_eq!( Vec::from([(Tick(2), Effect::Read(0xFFFD))] ), effects);
    }

    #[test]
    fn au_troisieme_tick_on_lit_CACA() { // parce que TUTU c'est pas hexadécimal
        // $FFFC = CA
        // $FFFD = CA
        let (state, _effects) = next_tick(NEW_STATE);
        let (state, _effects) = next_tick(state);
        let (_state, effects) = next_tick(state);
        assert_eq!( Vec::from([(Tick(3), Effect::Read(0xCACA))] ), effects);
    }
}
