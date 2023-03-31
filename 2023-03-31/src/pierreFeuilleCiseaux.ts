export const pierre = "pierre"
export const ciseaux = "ciseaux"
export const feuille = "feuille"

type Main = typeof pierre | typeof ciseaux | typeof feuille

type Resultat = "perd" | "gagne"

const quiGagne = (gauche: Main, droite: Main): Resultat => {
  return (gauche === pierre && droite === feuille) ||
    (gauche === feuille && droite === ciseaux)
    ? "perd"
    : "gagne"
}

export const pierreFeuilleCiseaux = (gauche: Main, droite: Main) => {
  const resultat = quiGagne(gauche, droite)
  return `${gauche} ${resultat} contre ${droite}`
}
