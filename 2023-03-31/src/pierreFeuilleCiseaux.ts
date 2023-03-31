export const pierre = "pierre"
export const ciseaux = "ciseaux"
export const feuille = "feuille"

const mains = [pierre, ciseaux, feuille] as const

type Main = typeof mains[number]

type Resultat = "perd" | "gagne"

const quiGagne = (gauche: Main, droite: Main): Resultat => {
  return (gauche === ciseaux && droite === pierre) ||
    (gauche === pierre && droite === feuille) ||
    (gauche === feuille && droite === ciseaux)
    ? "perd"
    : "gagne"
}

export const pierreFeuilleCiseaux = (gauche: Main, droite: Main) => {
  const resultat = quiGagne(gauche, droite)
  return `${gauche} ${resultat} contre ${droite}`
}
