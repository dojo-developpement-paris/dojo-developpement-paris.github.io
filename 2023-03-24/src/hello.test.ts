enum Main {
  PIERRE = "PIERRE",
  FEUILLE = "FEUILLE",
  CISEAUX = "CISEAUX",
}

enum Resultat {
  EGALITE = "EGALITE",
  MAIN1 = "MAIN1",
}

function match(main1: Main, main2: Main): Resultat {
  if (main1 === main2) return Resultat.EGALITE
  return Resultat.MAIN1
}

describe("pcf", () => {
  it.each([Main.PIERRE, Main.FEUILLE, Main.CISEAUX])(
    "donné deux mains identiques (%s) alors égalité",
    (main) => {
      expect(match(main, main)).toEqual(Resultat.EGALITE)
    }
  )

  it.each([[Main.PIERRE, Main.CISEAUX]])(
    "donné une pierre et un ciseaux alors pierre gagne",
    () => {
      expect(match(Main.PIERRE, Main.CISEAUX)).toEqual(Resultat.MAIN1)
    }
  )

  it("donné des ciseaux et une feuille alors ciseaux gagnent", () => {
    expect(match(Main.CISEAUX, Main.FEUILLE)).toEqual(Resultat.MAIN1)
  })

  it("donné une feuille et une pierre alors feuille gagne", () => {
    expect(match(Main.FEUILLE, Main.PIERRE)).toEqual(Resultat.MAIN1)
  })
})
