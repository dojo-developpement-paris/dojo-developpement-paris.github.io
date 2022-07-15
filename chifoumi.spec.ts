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

const chifoumi = (_: Mains, __: Mains): Mains | string => {
    if (_ === Mains.Pierre && __ === Mains.Pierre) return "égalité"
    if (_ === Mains.Feuille && __ === Mains.Pierre) return Mains.Feuille
    if (_ === Mains.Feuille && __ === Mains.Ciseaux) return Mains.Ciseaux
    return Mains.Pierre
}

describe('chifoumi', () => {
    it('pierre gagne', () => {
        const jeu = chifoumi(Mains.Ciseaux, Mains.Pierre)
        expect(jeu).toBe(Mains.Pierre)
    })

    it('ciseaux gagnent', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Ciseaux)
        expect(jeu).toBe(Mains.Ciseaux)
    })

    it('feuille gagne', () => {
        const jeu = chifoumi(Mains.Feuille, Mains.Pierre)
        expect(jeu).toBe(Mains.Feuille)
    })

    it('égalité', () => {
        const jeu = chifoumi(Mains.Pierre, Mains.Pierre)
        expect(jeu).toBe("égalité")
    })
})
