import { describe, expect, it } from "vitest"
import { GAME_STATE, tictactoe } from "./tictactoe"

describe("hello", () => {
  it("dans une partie à l'état initial c'est à X de jouer", () => {
    const game = tictactoe()
    expect(game).toEqual(GAME_STATE.X_TO_PLAY)
  })
  // it("après que X ai joué, c'est à O de jouer", () => {
  //   const game = move(initialGame, 1, 1)
  //  expect(game.status()).toEqual(GAME_STATE.O_TO_PLAY)
  // })
})
