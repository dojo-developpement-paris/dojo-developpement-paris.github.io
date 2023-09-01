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
    return this.moves.length === 0
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
  it("moves", () => {
    const move = [Coord.MID, Coord.TOP_LEFT]
    const initial_game = new Game([move, move])
    expect(initial_game.is_legal()).toBe(false)
  })
})
