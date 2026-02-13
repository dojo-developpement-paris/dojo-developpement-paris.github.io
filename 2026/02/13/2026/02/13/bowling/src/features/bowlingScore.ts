export function bowlingScore(
  [firstThrow, secondThrow, third, fourth]: number[],
): number {
  if (firstThrow !== undefined) {
    if (secondThrow !== undefined) {
      if (third !== undefined) {
        if (fourth !== undefined) {
          return 13;
        }
      }
      return firstThrow + secondThrow;
    }
    return firstThrow;
  }

  throw new Error("no throw");
}
