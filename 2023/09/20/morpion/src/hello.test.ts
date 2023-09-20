import { describe, expect, it } from "vitest"
import { initialGame, GAME_STATE } from "./tictactoe"

describe("hello", () => {
  it("une partie dans l'état initial est en cours", () => {
    const game = initialGame()
    expect(game.status()).toEqual(GAME_STATE.IN_PROGRESS)
  })
})
