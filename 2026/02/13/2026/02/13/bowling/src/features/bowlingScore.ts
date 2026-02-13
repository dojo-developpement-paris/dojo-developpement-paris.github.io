export function bowlingScore(
  throws: number[],
): number {
  return throws.reduce((acc, item) => item + acc, 0);
}
