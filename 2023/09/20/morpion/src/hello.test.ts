import { describe, expect, it } from "vitest"
import { initialGame, GAME_STATE } from "./tictactoe"

describe("hello", () => {
  it("dans une partie à l'état initial c'est à X de jouer", () => {
    const game = initialGame()
    expect(game.status()).toEqual(GAME_STATE.X_TO_PLAY)
  })
})
