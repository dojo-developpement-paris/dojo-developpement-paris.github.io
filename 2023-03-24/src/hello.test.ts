enum Main {
  PIERRE = "PIERRE",
  FEUILLE = "FEUILLE",
  CISEAUX = "CISEAUX",
}

enum Resultat {
  EGALITE,
  MAIN1,
}

function match(main1: Main, main2: Main): Resultat {
  if (main1 === Main.PIERRE && main2 === Main.CISEAUX) return Resultat.MAIN1
  return Resultat.EGALITE
}

describe("pcf", () => {
  it.each([Main.PIERRE, Main.FEUILLE, Main.CISEAUX])(
    "donné deux mains identiques (%s) alors égalité",
    (main) => {
      expect(match(main, main)).toEqual(Resultat.EGALITE)
    }
  )

  it("donné une pierre et un ciseaux alors pierre gagne", () => {
    expect(match(Main.PIERRE, Main.CISEAUX)).toEqual(Resultat.MAIN1)
  })
})
