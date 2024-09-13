import { describe, expect, it } from "vitest"

const Forme = {
  Feuille: "feuille",
  Pierre: "pierre",
  Ciseaux: "ciseaux",
}

const Résultat = {
  MainGauche: "la main gauche",
  MainDroite: "la main droite",
}
describe("pierre feuille ciseaux", () => {
  it("la feuille bat la pierre", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = Forme.Pierre

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.MainGauche)
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = Forme.Pierre
    const laMainDroite = Forme.Feuille

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.MainDroite)
  })

  it("les ciseaux battent la feuille", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = Forme.Ciseaux

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.MainDroite)
  })

  it("égalité si la main droite est identique à la main gauche", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = laMainGauche

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("égalité")
  })
})

function arbitre(gauche, droite) {
  if (gauche === droite) return "égalité"
  if (gauche === Forme.Feuille) {
    if (droite === Forme.Ciseaux) return Résultat.MainDroite
    else return Résultat.MainGauche
  }
  return Résultat.MainDroite
}
