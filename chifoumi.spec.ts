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
    if (_ === __) return EGALITE
    if (_ === Mains.Feuille && __ === Mains.Pierre || _ === Mains.Pierre && __ === Mains.Feuille) return Mains.Feuille
    if (_ === Mains.Feuille && __ === Mains.Ciseaux || _ === Mains.Ciseaux && __ === Mains.Feuille) return Mains.Ciseaux
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
