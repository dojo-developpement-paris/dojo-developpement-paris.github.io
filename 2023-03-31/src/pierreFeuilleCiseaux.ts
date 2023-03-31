export const pierre = "pierre"
export const ciseaux = "ciseaux"
export const feuille = "feuille"

const mains = [pierre, ciseaux, feuille] as const

type Main = typeof mains[number]

const egalise = "égalise"
const perd = "perd"
const gagne = "gagne"

type Resultat = typeof perd | typeof gagne | typeof egalise

type Message = `${Main} ${Resultat} contre ${Main}`

const plusFaibleQue = (element: Main): Main => {
  const indexCourant = mains.indexOf(element)
  const indexSuivant = indexCourant + 1
  const indexSuivantCirculaire = indexSuivant % mains.length
  return mains[indexSuivantCirculaire]
}

const quiGagne = (gauche: Main, droite: Main): Resultat => {
  if (gauche === droite) return egalise
  if (gauche === plusFaibleQue(droite)) return perd
  return gagne
}

export const pierreFeuilleCiseaux = (gauche: Main, droite: Main): Message => {
  const resultat = quiGagne(gauche, droite)
  return `${gauche} ${resultat} contre ${droite}`
}
