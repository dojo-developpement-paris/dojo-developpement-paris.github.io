import { describe, expect, it } from "vitest"

describe("pierre feuille ciseaux", () => {
  it("la feuille bat la pierre", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "pierre"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(laMainGauche)
  })

  it("la feuille bat la pierre", () => {
    const laMainGauche = "pierre"
    const laMainDroite = "feuille"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(laMainDroite)
  })
})

function arbitre(laMainGauche, laMainDroite) {
  if (laMainGauche === "feuille")
    return laMainGauche
  return laMainDroite
}
