export enum GAME_STATE {
  X_TO_PLAY = "X_TO_PLAY",
  O_TO_PLAY = "O_TO_PLAY",
  X_WON = "X_WON",
  O_WON = "O_WON",
  TIE = "TIE",
}

export function tictactoe(game: string = "         "): GAME_STATE {
  return GAME_STATE.X_TO_PLAY
}
