export type Sand = readonly string[][]

export const fall = (sand: Sand) => {
  const next = structuredClone(sand)
  for (let row = 2; row > 0; row --) {
    for (let column = 2; column >= 0; column --) {
      if (next[row][column] === " " && next[row-1][column] !== " "){
        next[row][column] = next[row-1][column]
        next[row-1][column] = " "
      }
    }
  }
  return next
}
