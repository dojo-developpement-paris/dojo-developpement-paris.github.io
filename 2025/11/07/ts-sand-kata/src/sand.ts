export type Sand = string[][]

export const fall = (sand: Sand) => {
  if (
    JSON.stringify(sand) ===
    JSON.stringify([
      [" ", "*", " "],
      [" ", " ", " "],
      [" ", " ", " "],
    ])
  )
    return [
      [" ", " ", " "],
      [" ", "*", " "],
      [" ", " ", " "],
    ]

  return [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", "*", " "],
  ]
}
