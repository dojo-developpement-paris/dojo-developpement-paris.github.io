export function bowlingScore([firstThrow, secondThrow]: number[]): number {
  if (firstThrow !== undefined && secondThrow !== undefined) {
    return firstThrow + secondThrow;
  }

  if (firstThrow !== undefined) {
    return firstThrow;
  }

  throw new Error("no throw");
}
