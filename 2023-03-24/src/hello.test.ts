enum Main {
  PIERRE = "🪨",
  FEUILLE = "🍁",
  CISEAUX = "✂️",
}

enum Resultat {
  EGALITE = "EGALITE",
  MAIN1 = "MAIN1",
  MAIN2 = "MAIN2",
}

const gagnant = new Map([
  [Main.PIERRE + Main.CISEAUX, Resultat.MAIN1],
  [Main.CISEAUX + Main.FEUILLE, Resultat.MAIN1],
  [Main.FEUILLE + Main.PIERRE, Resultat.MAIN1],

  [Main.PIERRE + Main.FEUILLE, Resultat.MAIN2],
  [Main.CISEAUX + Main.PIERRE, Resultat.MAIN2],
  [Main.FEUILLE + Main.CISEAUX, Resultat.MAIN2],
])

function match(main1: Main, main2: Main): Resultat {
  const resultat = gagnant.get(main1 + main2)
  return resultat ?? Resultat.EGALITE
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
  ])(
    "donné $main1 et $main2 alors ($main1) gagne",
    (main1, main2, resultat) => {
      expect(match(main1, main2)).toEqual(resultat)
    }
  )

  it.each([
    [Main.PIERRE, Main.FEUILLE, Resultat.MAIN2],
    [Main.CISEAUX, Main.PIERRE, Resultat.MAIN2],
    [Main.FEUILLE, Main.CISEAUX, Resultat.MAIN2],
  ])("donné %s et %s alors (%s) gagne", (main1, main2, resultat) => {
    expect(match(main1, main2)).toEqual(resultat)
  })
})
