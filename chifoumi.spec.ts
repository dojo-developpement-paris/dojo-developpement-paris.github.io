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

const chifoumi = (_: Mains, __: Mains) => {
    if (_ === Mains.Feuille && __ === Mains.Pierre) return Mains.Feuille
    if (_ === Mains.Feuille && __ === Mains.Ciseaux) return Mains.Ciseaux
    return Mains.Pierre
}

it('chifoumi', () => {
    const jeu = chifoumi(Mains.Ciseaux, Mains.Pierre)
    expect(jeu).toBe(Mains.Pierre)
})

it('toto', () => {
    const jeu = chifoumi(Mains.Feuille, Mains.Ciseaux)
    expect(jeu).toBe(Mains.Ciseaux)
})

it('tata', () => {
    const jeu = chifoumi(Mains.Feuille, Mains.Pierre)
    expect(jeu).toBe(Mains.Feuille)
})
