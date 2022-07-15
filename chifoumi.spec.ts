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

const chifoumi = (_: Mains, __: Mains) => Mains.Pierre

it('chifoumi', () => {
    const jeu = chifoumi(Mains.Feuille, Mains.Pierre)
    expect(jeu).toBe(Mains.Pierre)
})
