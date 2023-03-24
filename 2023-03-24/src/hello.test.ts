enum Main {
  PIERRE,
  FEUILLE,
}

enum Resultat {
  EGALITE,
}

function match(main1: Main, main2: Main): Resultat {
  return Resultat.EGALITE
}

describe("pcf", () => {
  it("donné deux pierres alors égalité", () => {
    expect(match(Main.PIERRE, Main.PIERRE)).toEqual(Resultat.EGALITE)
  })
  it("donné deux feuilles alors égalité", () => {
    expect(match(Main.FEUILLE, Main.FEUILLE)).toEqual(Resultat.EGALITE)
  })
})
