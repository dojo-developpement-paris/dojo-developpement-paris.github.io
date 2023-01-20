const cpf = (premièreMain: string, deuxièmeMain: string) => {
  if (deuxièmeMain === "pierre" && premièreMain === "ciseaux") {
    return "joueurDeux"
  }
  if (premièreMain === "pierre" && deuxièmeMain === "ciseaux") {
    return "joueurUn"
  }
  if (deuxièmeMain === "feuille" && premièreMain === "pierre") {
    return "joueurDeux"
  }
  if (premièreMain === "feuille" && deuxièmeMain === "pierre") {
    return "joueurUn"
  }
  if (premièreMain === "ciseaux" && deuxièmeMain === "feuille") {
    return "joueurUn"
  }
  return "égalité"
}

describe("égalité", () => {
  it("ciseaux contre ciseaux", () => {
    expect(cpf("ciseaux", "ciseaux")).toEqual("égalité")
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
  ])("avec %s", (main1, main2) => {
    expect(cpf(main1, main2)).toEqual("joueurDeux")
  })
})
