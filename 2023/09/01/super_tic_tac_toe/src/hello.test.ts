import { describe, expect, it } from "vitest"

class Game {
  moves
  constructor(moves) {
    this.moves = moves
  }
  is_won() {
    return false
  }
}

describe("a game", () => {
  it("is initially not won", () => {
    const initial_game = new Game([])
    expect(initial_game.is_won()).toBe(false)
  })
})
