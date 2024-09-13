import { describe, expect, it } from "vitest"

const Forme = {
  Feuille: "feuille",
  Pierre: "pierre",
  Ciseaux: "ciseaux",
}

describe("pierre feuille ciseaux", () => {
  it("la feuille bat la pierre", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = Forme.Pierre

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main gauche")
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = Forme.Pierre
    const laMainDroite = Forme.Feuille

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main droite")
  })

  it("les ciseaux battent la feuille", () => {
    const laMainGauche = Forme.Feuille
    const laMainDroite = Forme.Ciseaux

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main droite")
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
    if (droite === Forme.Ciseaux) return "la main droite"
    else return "la main gauche"
  }
  return "la main droite"
}
