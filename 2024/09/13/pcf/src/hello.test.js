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
    expect(arbitre(Forme.Feuille, Forme.Feuille)).toEqual(Résultat.Égalité)
  })

  it("la feuille bat la pierre", () => {
    expect(arbitre(Forme.Feuille, Forme.Pierre)).toEqual(Résultat.MainGauche)
    expect(arbitre(Forme.Pierre, Forme.Feuille)).toEqual(Résultat.MainDroite)
  })

  it("les ciseaux battent la feuille", () => {
    expect(arbitre(Forme.Feuille, Forme.Ciseaux)).toEqual(Résultat.MainDroite)
    expect(arbitre(Forme.Ciseaux, Forme.Feuille)).toEqual(Résultat.MainGauche)
  })

  it("la pierre casse les ciseaux", () => {
    expect(arbitre(Forme.Pierre, Forme.Ciseaux)).toEqual(Résultat.MainGauche)
    expect(arbitre(Forme.Ciseaux, Forme.Pierre)).toEqual(Résultat.MainDroite)
  })
})

const batailles = {
  [Forme.Feuille + Forme.Pierre]: Résultat.MainGauche,
  [Forme.Pierre + Forme.Feuille]: Résultat.MainDroite,

  [Forme.Ciseaux + Forme.Feuille]: Résultat.MainGauche,
  [Forme.Feuille + Forme.Ciseaux]: Résultat.MainDroite,

  [Forme.Pierre + Forme.Ciseaux]: Résultat.MainGauche,
  [Forme.Ciseaux + Forme.Pierre]: Résultat.MainDroite,
}

function arbitre(gauche, droite) {
  if (gauche === droite) return Résultat.Égalité

  return batailles[gauche + droite]
}
