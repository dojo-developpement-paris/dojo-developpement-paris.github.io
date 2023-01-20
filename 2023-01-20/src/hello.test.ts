function victoire(premièreMain: string, deuxièmeMain: string) {
  if (premièreMain === "pierre" && deuxièmeMain === "ciseaux") {
    return true
  }
  if (premièreMain === "feuille" && deuxièmeMain === "pierre") {
    return true
  }
  if (premièreMain === "ciseaux" && deuxièmeMain === "feuille") {
    return true
  }
}

const cpf = (premièreMain: string, deuxièmeMain: string) => {
  if (victoire(premièreMain, deuxièmeMain)) {
    return "joueurUn"
  }
  if (victoire(deuxièmeMain, premièreMain)) {
    return "joueurDeux"
  }
  return "égalité"
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
