import { describe, expect, it } from "vitest"

const Forme = {
  Feuille: "feuille",
  Pierre: "pierre",
  Ciseaux: "ciseaux",
}

const Résultat = {
  MainGauche: "la main gauche",
  MainDroite: "la main droite",
  Égalité: "égalité",
}
describe("pierre feuille ciseaux", () => {
  it("égalité si la main droite est identique à la main gauche", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = laMainGauche

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.Égalité)
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = Forme.Pierre

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.MainGauche)
    expect(arbitre(laMainDroite, laMainGauche)).toEqual(Résultat.MainDroite)
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

  it("la pierre casse les ciseaux", () => {
    const laMainGauche = Forme.Pierre
    const laMainDroite = Forme.Ciseaux

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(Résultat.MainGauche)
  })
})

function arbitre(gauche, droite) {
  if (gauche === droite) return Résultat.Égalité
  if (gauche === Forme.Pierre && droite === Forme.Ciseaux)
    return Résultat.MainGauche
  if (gauche === Forme.Feuille && droite === Forme.Ciseaux)
    return Résultat.MainDroite
  if (gauche === Forme.Feuille) return Résultat.MainGauche
  return Résultat.MainDroite
}
