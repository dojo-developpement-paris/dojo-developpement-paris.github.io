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
    if (this.moves.length === 0) {
      return true
    }

    return false
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
  // it("the next move should be in the right grid", () => {
  //     const move = [Coord.MID, Coord.TOP_LEFT]
  //     const next = [Coord.TOP_LEFT, Coord.MID]
  //     const initial_game = new Game([move, next])
  //     expect(initial_game.is_legal()).toBe(true)
  // })
})
