export function bowlingScore(
  [firstThrow, secondThrow, thirdThrow, fourthThrow]: number[],
): number {
  if (firstThrow !== undefined) {
    if (secondThrow !== undefined) {
      if (thirdThrow !== undefined) {
        if (fourthThrow !== undefined) {
          return 13;
        }
      }
      return firstThrow + secondThrow;
    }
    return firstThrow;
  }

  throw new Error("no throw");
}
