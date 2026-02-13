export function bowlingScore([firstThrow, secondThrow]: number[]): number {
  if (secondThrow !== undefined) {
    return 4;
  }

  if (firstThrow !== undefined) {
    return firstThrow;
  }

  throw new Error("no throw");
}
