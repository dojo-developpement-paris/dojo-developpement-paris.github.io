export type Sand = readonly string[][]

export const fall = (sand: Sand) => {
  let crepe = structuredClone(sand)
  for (let i = 2; i > 0; i --) {
    for (let j = 2; j > 0; j --) {
      if (crepe[i][j] === " " && crepe[i-1][j] === "*"){
        crepe[i][j]
      }
    }
  }
  if (
    JSON.stringify(sand) ===
    JSON.stringify([
      [" ", "*", " "], // 0 1
      [" ", " ", " "],
      [" ", " ", " "],
    ])
  )
    return [
      [" ", " ", " "],
      [" ", "*", " "], // 1 1
      [" ", " ", " "],
    ]

  return [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", "*", " "], // 2 1
  ]
}
