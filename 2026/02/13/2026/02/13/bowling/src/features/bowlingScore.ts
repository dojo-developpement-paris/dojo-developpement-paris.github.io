export function bowlingScore([firstThrow]: number[]): number {
  if (firstThrow !== undefined) {
    return firstThrow;
  }

  throw new Error("no throw");
}
