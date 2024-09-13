import { describe, expect, it } from "vitest"

describe("pierre feuille ciseaux", () => {
  it("la feuille bat la pierre", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "pierre"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(laMainGauche)
  })
})

function arbitre(laMainGauche, laMainDroite) {
  return laMainGauche
}
