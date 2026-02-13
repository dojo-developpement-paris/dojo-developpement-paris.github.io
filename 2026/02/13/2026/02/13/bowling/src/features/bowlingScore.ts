export function bowlingScore(throws: number[]): number {
  const firstThrow = throws[0];
  if (firstThrow !== undefined) {
    return firstThrow;
  }

  throw new Error("no throw");
}
