enum main {
  pierre,
}

enum resultat {
  egalite,
}

function match(main1: main, main2: main): resultat {
  return resultat.egalite
}

describe("pcf", () => {
  it("donné deux pierres alors égalité", () => {
    expect(match(main.pierre, main.pierre)).toEqual(resultat.egalite)
  })
})
