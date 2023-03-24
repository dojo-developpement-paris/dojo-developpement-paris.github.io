enum Main {
  pierre,
}

enum Resultat {
  EGALITE,
}

function match(main1: Main, main2: Main): Resultat {
  return Resultat.EGALITE
}

describe("pcf", () => {
  it("donné deux pierres alors égalité", () => {
    expect(match(Main.pierre, Main.pierre)).toEqual(Resultat.EGALITE)
  })
})
