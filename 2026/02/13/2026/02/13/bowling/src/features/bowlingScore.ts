export function bowlingScore(
  throws: number[],
): number {
  return throws.reduce((acc, item) => item + acc) + bonus(throws);
}

function bonus(throws: number[]): number {
  let bonus = 0;
  for (let frameNumber = 0; frameNumber < throws.length / 2; frameNumber++) {
    const firstThrow = throws[frameNumber * 2];
    const secondThrow = throws[frameNumber * 2 + 1];
    if ((firstThrow! + secondThrow!) === 10) {
      const thirdThrow = throws[frameNumber * 2 + 1 + 1];
      bonus += thirdThrow!;
    }
  }

  return bonus;
}

/*
* 3 3 recursive
* 1 4 découpage en frame
* 0 0 itération avec état

* 4 ajout des bonus avec fonction séparée
*/
