enum Main {
  PIERRE,
  FEUILLE,
  CISEAUX,
}

enum Resultat {
  EGALITE,
}

function match(main1: Main, main2: Main): Resultat {
  return Resultat.EGALITE
}

describe("pcf", () => {
  it.each([Main.PIERRE, Main.FEUILLE, Main.CISEAUX])(
    "donné deux mains identiques alors égalité",
    (main) => {
      expect(match(main, main)).toEqual(Resultat.EGALITE)
    }
  )
  it("donné deux feuilles alors égalité", () => {
    expect(match(Main.FEUILLE, Main.FEUILLE)).toEqual(Resultat.EGALITE)
  })
  it("donné deux ciseaux alors égalité", () => {
    expect(match(Main.CISEAUX, Main.CISEAUX)).toEqual(Resultat.EGALITE)
  })
})
