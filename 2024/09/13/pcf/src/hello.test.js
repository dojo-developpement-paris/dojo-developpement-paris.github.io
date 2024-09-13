import { describe, expect, it } from "vitest"

describe("pierre feuille ciseaux", () => {
  it("la feuille bat la pierre", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "pierre"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main gauche")
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = "pierre"
    const laMainDroite = "feuille"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main droite")
  })

  it("les ciseaux battent la feuille", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "ciseaux"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("la main droite")
  })

  it("égalité si la main droite est identique à la main gauche", () => {
    const laMainGauche = "feuille"
    const laMainDroite = laMainGauche

    expect(arbitre(laMainGauche, laMainDroite)).toEqual("égalité")
  })
})

function arbitre(gauche, droite) {
  if (gauche === droite) return "égalité"
  if (gauche === "feuille") {
    if (droite === "ciseaux") return "la main droite"
    else return "la main gauche"
  }
  return "la main droite"
}
