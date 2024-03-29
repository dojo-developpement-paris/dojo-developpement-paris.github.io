import { describe, expect, it } from "vitest"

enum Coord {
  TOP_LEFT,
  TOP_MID,
  TOP_RIGHT,
  MID_LEFT,
  MID,
}

class Game {
  moves
  constructor(moves) {
    this.moves = moves
  }
  is_won() {
    return false
  }

  is_legal() {
    //Ca devrait marcher mais le langage est pourri
    if (new Set(this.moves).size !== this.moves.length) return false

    if (this.moves.length !== 0) {
      return this.moves[1][0] == this.moves[0][1]
    }

    return true
  }
}

describe("a game", () => {
  it("is initially not won", () => {
    const initial_game = new Game([])
    expect(initial_game.is_won()).toBe(false)
  })
  it("no moves is legal", () => {
    const initial_game = new Game([])
    expect(initial_game.is_legal()).toBe(true)
  })
  it("two moves on the same place is illegal", () => {
    const move = [Coord.MID, Coord.TOP_LEFT]
    const same_move = move
    const initial_game = new Game([move, same_move])
    expect(initial_game.is_legal()).toBe(false)
  })
  it("the next move should be in the right grid", () => {
    const move = [Coord.MID, Coord.TOP_LEFT]
    const next = [Coord.TOP_LEFT, Coord.MID]
    const initial_game = new Game([move, next])
    expect(initial_game.is_legal()).toBe(true)
  })
  it("the next move should be in the right grid", () => {
    const move = [Coord.MID, Coord.TOP_LEFT]
    const next = [Coord.TOP_LEFT, Coord.MID]
    const next2 = [Coord.MID, Coord.TOP_LEFT]

    const initial_game = new Game([move, next, next2])
    expect(initial_game.is_legal()).toBe(false)
  })
})
