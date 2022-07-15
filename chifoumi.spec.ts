// feuille pierre ciseaux
// feuille > pierre
// pierre > ciseaux
// ciseaux > feuille


// feuille et pierre = feuille
enum Mains {
    Feuille,
    Pierre,
    Ciseaux
}

const EGALITE = "égalité"

const chifoumi = (_: Mains, __: Mains): Mains | typeof EGALITE => {
    if (_ === Mains.Pierre && __ === Mains.Pierre) return EGALITE
    if (_ === Mains.Feuille && __ === Mains.Pierre) return Mains.Feuille
    if (_ === Mains.Feuille && __ === Mains.Ciseaux) return Mains.Ciseaux
    return Mains.Pierre
}

describe('chifoumi', () => {
    it('pierre gagne contre ciseaux', () => {
        const jeu = chifoumi(Mains.Ciseaux, Mains.Pierre)
        expect(jeu).toBe(Mains.Pierre)
    })

    it('ciseaux gagnent contre feuille', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Ciseaux)
        expect(jeu).toBe(Mains.Ciseaux)
    })

    it('feuille gagne contre pierre', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Pierre)
        expect(jeu).toBe(Mains.Feuille)
    })

    it('égalité sur pierre', () => {
        const jeu = chifoumi(Mains.Pierre, Mains.Pierre)
        expect(jeu).toBe("égalité")
    })
})
