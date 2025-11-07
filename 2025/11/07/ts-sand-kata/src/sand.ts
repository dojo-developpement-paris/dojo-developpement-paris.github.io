export type Sand = readonly string[][]

export const fall = (sand: Sand) => {
  const crepe = structuredClone(sand)
  for (let i = 2; i > 0; i --) {
    for (let j = 2; j >= 0; j --) {
      if (crepe[i][j] === " " && crepe[i-1][j] === "*"){
        crepe[i][j] = "*"
        crepe[i-1][j] = " "
      }
    }
  }
  return crepe
}
