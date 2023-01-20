function gagnant(premièreMain: string, deuxièmeMain: string): "Un" | "Deux" {
  if (premièreMain === "pierre" && deuxièmeMain === "ciseaux") {
    return "Un"
  }
  if (premièreMain === "feuille" && deuxièmeMain === "pierre") {
    return "Un"
  }
  if (premièreMain === "ciseaux" && deuxièmeMain === "feuille") {
    return "Un"
  }
  return "Deux"
}

const cpf = (
  premièreMain: string,
  deuxièmeMain: string
): "égalité" | "joueurUn" | "joueurDeux" => {
  if (premièreMain === deuxièmeMain) {
    return "égalité"
  }
  return `joueur${gagnant(premièreMain, deuxièmeMain)}`
}

describe("égalité", () => {
  it.each([["pierre"], ["feuille"], ["ciseaux"]])("avec %s", (main) => {
    expect(cpf(main, main)).toEqual("égalité")
  })
})

describe("victoire premièreMain", () => {
  it.each([
    ["pierre", "ciseaux"],
    ["feuille", "pierre"],
    ["ciseaux", "feuille"],
  ])("avec %s", (main1, main2) => {
    expect(cpf(main1, main2)).toEqual("joueurUn")
  })
})

describe("victoire deuxièmeMain", () => {
  it.each([
    ["ciseaux", "pierre"],
    ["pierre", "feuille"],
    ["feuille", "ciseaux"],
  ])("avec %s", (main1, main2) => {
    expect(cpf(main1, main2)).toEqual("joueurDeux")
  })
})
