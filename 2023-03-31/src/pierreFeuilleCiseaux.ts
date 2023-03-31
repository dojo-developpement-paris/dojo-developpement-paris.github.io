export const pierre = "pierre"
export const ciseaux = "ciseaux"
export const feuille = "feuille"

const mains = [pierre, ciseaux, feuille] as const

type Main = typeof mains[number]

type Resultat = "perd" | "gagne"

const plusFaibleQue = (element: Main): Main => {
  const indexCourant = mains.indexOf(element)
  const indexSuivant = indexCourant + 1
  const indexSuivantCirculaire = indexSuivant % mains.length
  return mains[indexSuivantCirculaire]
}

const quiGagne = (gauche: Main, droite: Main): Resultat => {
  return gauche === plusFaibleQue(droite) ? "perd" : "gagne"
}

export const pierreFeuilleCiseaux = (gauche: Main, droite: Main) => {
  const resultat = quiGagne(gauche, droite)
  return `${gauche} ${resultat} contre ${droite}`
}
