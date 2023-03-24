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
    [Main.PIERRE, Main.CISEAUX, Resultat.MAIN1],
    [Main.CISEAUX, Main.FEUILLE, Resultat.MAIN1],
    [Main.FEUILLE, Main.PIERRE, Resultat.MAIN1],
  ])("donné %s et %s alors main 1 gagne", (main1, main2, resultat) => {
    expect(match(main1, main2)).toEqual(resultat)
  })
})
