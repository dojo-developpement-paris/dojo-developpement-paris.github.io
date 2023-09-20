export enum GAME_STATE {
  IN_PROGRESS = "IN_PROGRESS",
  X_WON = "X_WON",
  O_WON = "O_WON",
  TIE = "TIE",
}

export const initialGame = () => ({
  status() {
    return GAME_STATE.IN_PROGRESS
  },
})
