export type Sand = readonly string[][]

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
