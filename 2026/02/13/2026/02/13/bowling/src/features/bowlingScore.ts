export function bowlingScore(
  throws: number[],
): number {
  return throws.reduce((acc, item) => item + acc) + bonus(throws);
}

function bonus([firstThrow, secondThrow, thirdThrow]: number[]): number {
  if (firstThrow! + secondThrow! === 10) {
    return thirdThrow!;
  }
  return 0;
}

/*
 * 3 recursive
 * 1 découpage en frame
 * 0 itération avec état
 * 4 ajout des bonus avec fonction séparée
 */
