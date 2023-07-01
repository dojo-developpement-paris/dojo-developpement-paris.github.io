/*
Nous ne sommes pas télépathes :
si vous ne dites pas que vous ne comprennez pas, on ne peut pas le savoir ;
il n'y a donc **pas de questions stupides**

Any live cell with fewer than two live neighbours dies, as if by underpopulation.
Any live cell with two or three live neighbours lives on to the next generation.
Any live cell with more than three live neighbours dies, as if by overpopulation.
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
*/
type Cell = [number, number]
type World = Cell[]
const computeNextGeneration = (unMonde: World): World => {
  const cell = unMonde[0]
  if (unMonde.find(([x, y]) => x === 0 && y === 1)) {
    console.log("il y a une cellule en 0,1")
  } else {
    console.log("il n y a pas de cellule vivante en 0,1 (elle est morte)")
  }
  if (unMonde.length === 3) {
    return [
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ]
  }
  return unMonde
}

describe("Game of Life", () => {
  it("un monde vide ne bouge pas", () => {
    const unMondeVide: World = []
    expect(computeNextGeneration(unMondeVide)).toEqual(unMondeVide)
  })

  // TODO nom du test
  it("génération 1", () => {
    const square: World = [
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ]

    const newWorld = computeNextGeneration(square)

    expect(newWorld).toEqual(square)
  })

  it("génération 0", () => {
    const world: World = [
      [0, 0],
      [0, 1],
      [1, 0],
    ]
    const square: World = [
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ]

    const newWorld = computeNextGeneration(world)

    expect(newWorld).toEqual(square)
  })

  it.only("tutu", () => {
    const world: World = [
      [0, 0],
      [0, 2],
      [2, 0],
    ]

    const newWorld = computeNextGeneration(world)

    expect(newWorld).toEqual([[1, 1]])
  })
})
