export type Sand = string[][]

export const fall = (sand: Sand) => {
  for (let row = sand.length - 1; row > 0; row--) {
    for (let column = 2; column >= 0; column--) {
      if (sand[row][column] === " " && sand[row - 1][column] !== " ") {
        sand[row][column] = sand[row - 1][column]
        sand[row - 1][column] = " "
      }
    }
  }
  return sand
}
