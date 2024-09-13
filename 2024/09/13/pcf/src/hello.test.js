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

function arbitre(gauche, droite) {
  if (gauche === droite) return Résultat.Égalité

  if (gauche === Forme.Feuille && droite === Forme.Pierre)
    return Résultat.MainGauche
  if (gauche === Forme.Pierre && droite === Forme.Feuille)
    return Résultat.MainDroite

  if (gauche === Forme.Feuille && droite === Forme.Ciseaux)
    return Résultat.MainDroite
  if (gauche === Forme.Ciseaux && droite === Forme.Feuille)
    return Résultat.MainGauche

  if (gauche === Forme.Pierre && droite === Forme.Ciseaux)
    return Résultat.MainGauche
  if (gauche === Forme.Ciseaux && droite === Forme.Pierre)
    return Résultat.MainDroite

  throw new Error("résultat impossible")
}
