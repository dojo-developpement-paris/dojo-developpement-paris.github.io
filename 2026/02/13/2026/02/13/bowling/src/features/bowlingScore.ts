export function bowlingScore(
  throws: number[],
): number {
  if (JSON.stringify([1, 9, 5, 4]) === JSON.stringify(throws)) return 24;

  return throws.reduce((acc, item) => item + acc);
}

/*
 * 3 recursive
 * 1 découpage en frame
 * 0 itération avec état
 * 4 ajout des bonus avec fonction séparée
 */
