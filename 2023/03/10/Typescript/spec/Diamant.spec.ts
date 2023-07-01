const espacement = nombreDEspaces => Array(nombreDEspaces).fill(' ').join('')

const pointDeDépart = 'A'.charCodeAt(0)
const lettre = indice => String.fromCharCode(pointDeDépart + indice)

const indice = lettre => lettre.charCodeAt(0) - pointDeDépart

const mirroir = liste => {
    const l_autre = [...liste].reverse()
    l_autre.shift()
    return l_autre
}

const ligneLettre = (indice_max, curseur) => {
    if (curseur === 0) {
        return `${espacement(indice_max - curseur)}${lettre(curseur)}`
    }
    return `${espacement(indice_max - curseur)}${lettre(curseur)}${espacement(curseur)}${lettre(curseur)}`
}

const diamant = lettre_max => {
    const indice_max = indice(lettre_max)
    const les_a = lettre(0)
    const les_b = `${lettre(1)}${espacement(1)}${lettre(1)}`
    const les_c = `${lettre(2)}${espacement(3)}${lettre(2)}`
    let curseur = 0
    let lignes = []
    if (indice_max === 1) {
        lignes[0] = ligneLettre(indice_max, curseur)
        curseur += 1
        lignes[1] = ligneLettre(indice_max, curseur)
    }
    else {
        lignes = [
            `${espacement(indice_max - (curseur + 0))}${les_a}`,
            `${espacement(indice_max - (curseur + 1))}${les_b}`,
            `${espacement(indice_max - (curseur + 2))}${les_c}`,
        ]
    }
    return (lignes.concat(mirroir(lignes))).join('\n') + '\n'
}
describe("diamant", () => {

    it("crée un diamant B", () => {
        const attendu =
            ` A
B B
 A
`
        expect(diamant("B")).toEqual(attendu)
    });

    it("crée un diamant C", () => {
        const attendu =

            `  A
 B B
C   C
 B B
  A
`
        expect(diamant("C")).toEqual(attendu)
    })

});