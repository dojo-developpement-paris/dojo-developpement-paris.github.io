export function bowlingScore([firstThrow, secondThrow]: number[]): number {
  if (firstThrow !== undefined) {
    if (secondThrow !== undefined) {
      return firstThrow + secondThrow;
    }
    return firstThrow;
  }

  throw new Error("no throw");
}
