// feuille pierre ciseaux
// feuille > pierre
// pierre > ciseaux
// ciseaux > feuille


// feuille et pierre = feuille
enum Mains {
    Ciseaux = 0,
    Pierre = 1,
    Feuille = 2
}

const EGALITE = "égalité"

const chifoumi = (main_A: Mains, main_B: Mains): Mains | typeof EGALITE => {
    if (main_A === main_B) return EGALITE
    if (main_A === Mains.Feuille && main_B === Mains.Ciseaux || main_A === Mains.Ciseaux && main_B === Mains.Feuille) return Mains.Ciseaux
    if (main_A > main_B) return main_A
    return main_B
}

describe('chifoumi', () => {
    it('pierre gagne contre ciseaux', () => {
        const jeu = chifoumi(Mains.Ciseaux, Mains.Pierre)
        expect(jeu).toBe(Mains.Pierre)
    })

    it('pierre gagne contre ciseaux et inversement', () => {
        const jeu = chifoumi(Mains.Pierre, Mains.Ciseaux)
        expect(jeu).toBe(Mains.Pierre)
    })

    it('ciseaux gagnent contre feuille', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Ciseaux)
        expect(jeu).toBe(Mains.Ciseaux)
    })

    it('ciseaux gagnent contre feuille et inversement', () => {
        const jeu = chifoumi(Mains.Ciseaux, Mains.Feuille)
        expect(jeu).toBe(Mains.Ciseaux)
    })

    it('feuille gagne contre pierre', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Pierre)
        expect(jeu).toBe(Mains.Feuille)
    })

    it('feuille gagne contre pierre et inversement', () => {
        const jeu = chifoumi(Mains.Pierre, Mains.Feuille)
        expect(jeu).toBe(Mains.Feuille)
    })

    it.each([Mains.Pierre, Mains.Ciseaux, Mains.Feuille])('égalité', (main) => {
        const jeu = chifoumi(main, main)
        expect(jeu).toBe("égalité")
    })
})
