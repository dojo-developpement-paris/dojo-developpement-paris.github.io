export function bowlingScore(autreChose: number[]): number {
  const newVariable = autreChose[0];
  if (newVariable !== undefined) {
    return newVariable;
  }

  throw new Error("no throw");
}
