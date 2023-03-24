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

  it.each([
    [Main.PIERRE, Main.CISEAUX],
    [Main.CISEAUX, Main.FEUILLE],
    [Main.FEUILLE, Main.PIERRE],
  ])("donné une pierre et un ciseaux alors pierre gagne", (main1, main2) => {
    expect(match(main1, main2)).toEqual(Resultat.MAIN1)
  })
})
