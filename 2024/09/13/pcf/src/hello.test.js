import { describe, expect, it } from "vitest"

describe("hello", () => {


  it("la feuille bat la pierre", () => {
    const laMainGauche = "feuille"
    const laMainDroite = "pierre"

    expect(arbitre(laMainGauche, laMainDroite)).toEqual(laMainGauche)
  })
})

function arbitre(laMainGauche, laMainDroite) {
  return laMainGauche
}
