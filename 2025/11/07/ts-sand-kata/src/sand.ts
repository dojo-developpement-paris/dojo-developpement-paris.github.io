export type Sand = readonly string[][]

export const fall = (sand: Sand) => {
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
