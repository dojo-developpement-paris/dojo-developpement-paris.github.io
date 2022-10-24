import { describe, it } from "https://deno.land/std@0.141.0/testing/bdd.ts";
import { expect } from "https://deno.land/x/expect@v0.2.10/mod.ts";

/*
 | |       | |
-+-+-     -+-+-
 | |   =>  | |
-+-+-     -+-+-
 | |       | |


 | |       | |
-+-+-     -+-+-
 |x|   =>  | |
-+-+-     -+-+-
 | |       | |


 | |x      | |
-+-+-     -+-+-
 | |   =>  | |
-+-+-     -+-+-
 | |       | |


 | |       | |
-+-+-     -+-+-
 |x|x  =>  | |
-+-+-     -+-+-
 | |       | |


 |x|       | |
-+-+-     -+-+-
 |x|   =>  | |
-+-+-     -+-+-
 | |       | |


 |x|       | |
-+-+-     -+-+-
 |x|   =>  |x|
-+-+-     -+-+-
 |x|       | |


 |x|       | |
-+-+-     -+-+-
 | |x  =>  |x|x
-+-+-     -+-+-
 |x|       | |


x| |x      | |
-+-+-     -+-+-
 | |   =>  |x|
-+-+-     -+-+-
 | |x      | |


x| |x      | |
-+-+-     -+-+-
 |x|   =>  |x|
-+-+-     -+-+-
 | |x      | |


x| |       | |
-+-+-     -+-+-
 |x|   =>  |x|
-+-+-     -+-+-
 | |x      | |


 | |       |x|       | |
-+-+-     -+-+-     -+-+-
x|x|x  =>  |x|   => x|x|x
-+-+-     -+-+-     -+-+-
 | |       |x|       | |

Any live cell with fewer than two live neighbours dies, as if by underpopulation.
Any live cell with two or three live neighbours lives on to the next generation.
Any live cell with more than three live neighbours dies, as if by overpopulation.
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
*/
type Coordinate = {
  x: number;
  y: number;
};

type Cell = Coordinate;

type LivingCells = Array<Cell>;

function computeNextGeneration(livingCells: LivingCells): LivingCells {
  return [];
}

describe("Game of life", () => {
  describe("Universe is empty", () => {
    it("stays empty at the next generation", () => {
      const livingCells: LivingCells = [];

      const nextGeneration = computeNextGeneration(livingCells);

      expect(nextGeneration).toEqual(livingCells);
    });

    it("a cell alone will die", () => {
      const livingCells: LivingCells = [
        { x: 1, y: 1 },
      ];

      const nextGeneration = computeNextGeneration(livingCells);

      expect(nextGeneration).toEqual([]);
    });

    it("two neighbours cells alone will die", () => {
      const livingCells: LivingCells = [
        { x: 1, y: 1 },
        { x: 2, y: 1 },
      ];

      const nextGeneration = computeNextGeneration(livingCells);

      expect(nextGeneration).toEqual([]);
    });

    it("a cell alone will die again", () => {
      const livingCells: LivingCells = [
        { x: 2, y: 0 },
      ];

      const nextGeneration = computeNextGeneration(livingCells);

      expect(nextGeneration).toEqual([]);
    });
  });
});
