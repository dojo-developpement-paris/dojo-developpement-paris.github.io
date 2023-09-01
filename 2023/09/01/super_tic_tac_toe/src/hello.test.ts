import { describe, expect, it } from "vitest"

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
    const big_grid = [0, 0]
    const sub_grid = [0, 0]
    const move = [big_grid, sub_grid]
    const initial_game = new Game([move, move])
    expect(initial_game.is_legal()).toBe(false)
  })
})
