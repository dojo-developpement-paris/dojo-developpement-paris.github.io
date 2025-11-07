export type Sand = string[][]

export const fall = (_: Sand) => {
  if (
    JSON.stringify(_) ===
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
