import { describe, expect, it } from "./dev_deps.ts";
import { uniqueArray } from "https://raw.githubusercontent.com/hugoalh-studio/unique-array-deno/main/mod.ts";

/*
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with more than three live neighbours dies, as if by overcrowding.
3. Any live cell with two or three live neighbours lives on to the next generation.
4. Any dead cell with exactly three live neighbours becomes a live cell.

comment ça va ?
il faudrait faire quoi pour que tu partes content-e ?
t'aimerais qu'on atteigne quoi d'ici 21h ?

avancer sur l'implem simple ++
faire spawn des cellules +
implementé le cas avec 3 cellules
arriver à faire flip flop avec le champs de 9 cases +
faire une UI
compter le voisinnage et l'accumuler +

1. if the sum of all nine fields in a given neighborhood is three, the inner field state for the next generation will be life
2. if the all-field sum is four, the inner field retains its current state
3. and every other sum sets the inner field to death.
*/

type Coordinates = [number, number];

type State = Coordinates[];

const neighborhood = ([x, y]: Coordinates): Coordinates[] => [
  [x - 1, y - 1],
  [x + 0, y - 1],
  [x + 1, y - 1],
  [x - 1, y + 0],
  [x + 0, y + 0],
  [x + 1, y + 0],
  [x - 1, y + 1],
  [x + 0, y + 1],
  [x + 1, y + 1],
];

describe("coordonnées d'un voisinnage", () => {
  it("coordonnées", () => {
    expect(neighborhood([0, 0])).toEqual([
      [-1, -1],
      [0, -1],
      [1, -1],
      [-1, 0],
      [0, 0],
      [1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
    ]);
  });
  it("coordonnées", () => {
    expect(neighborhood([1, 1])).toEqual([
      [0, 0],
      [1, 0],
      [2, 0],
      [0, 1],
      [1, 1],
      [2, 1],
      [0, 2],
      [1, 2],
      [2, 2],
    ]);
  });
});

const countNeigbours = (coordinate: Coordinates, state: State): number => {
  let count = 0;
  const neighbours = neighborhood(coordinate);
  for (const [a, b] of neighbours) {
    for (const [x, y] of state) {
      if (a === x && b === y) {
        count++;
      }
    }
  }
  return count;
};

describe("count neighbours", () => {
  it("compte le nombre de cellules vivantes d'un voisinnage", () => {
    expect(countNeigbours([0, 0], [[0, 0], [0, 1], [-1, -1], [2, 5]])).toEqual(
      3,
    );
  });

  it("dans le vide, il n'y a pas de cellule", () => {
    expect(countNeigbours([0, 0], [])).toEqual(0);
  });
});

/*
1. if the sum of all nine fields in a given neighborhood is three, the inner field state for the next generation will be life
2. if the all - field sum is four, the inner field retains its current state
3. and every other sum sets the inner field to death.
*/
// vive le bottom up
const willLive = (coordinate: Coordinates, state: State): boolean => {
  const neighbourCount = countNeigbours(coordinate, state);
  return neighbourCount === 3 || neighbourCount === 4;
};

describe("détermine l'état d'une cellule", () => {
  it("vivra si voisinnage de 3 cellules", () => {
    expect(willLive([0, 0], [[0, 0], [0, 1], [-1, -1], [2, 5]])).toEqual(true);
  });
  it("naitra si voisinnage de 3 cellules", () => {
    expect(willLive([0, 0], [[1, 1], [0, 1], [-1, -1], [2, 5]])).toEqual(true);
  });
  it("vivra si voisinnage de 4 cellules", () => {
    expect(willLive([0, 0], [[0, 0], [1, 1], [0, 1], [-1, -1], [2, 5]]))
      .toEqual(true);
  });
  it("mourra ou ne naitra pas si isolée", () => {
    expect(willLive([0, 0], [[-1, -1], [2, 5]])).toEqual(false);
  });
  it("mourra si trop entouré", () => {
    expect(willLive([0, 0], [[0, 0], [1, 1], [0, 1], [1, 0], [-1, -1], [2, 5]]))
      .toEqual(false);
  });
  it("naitra si voisinnage de 3 cellules", () => {
    expect(willLive([0, 0], [[1, 1], [0, 1], [-1, -1], [2, 5]])).toEqual(true);
  });
});

const gameOfLife = (state: State): State => {
  const result = [];
  const potentialLivingCells = state.map(neighborhood).flat();
  for (const cell of potentialLivingCells) {
    if (willLive(cell, state)) {
      result.push(cell);
    }
  }
  return uniqueArray(result).toSorted();
};

describe("game of life", () => {
  it("vide", () => {
    expect(gameOfLife([])).toEqual([]);
  });

  it("une cellule seule meurt", () => {
    expect(gameOfLife([[0, 0]])).toEqual([]);
  });

  it("une carré de cellule vie", () => {
    expect(gameOfLife([
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ])).toEqual([
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ].toSorted());
  });

  it("pipe dash", () => {
    expect(gameOfLife([
      [1, 0],
      [1, 1],
      [1, 2],
    ])).toEqual([
      [0, 1],
      [1, 1],
      [2, 1],
    ].toSorted());
  });

  it("dash pipe", () => {
    expect(gameOfLife([
      [0, 1],
      [1, 1],
      [2, 1],
    ])).toEqual([
      [1, 0],
      [1, 1],
      [1, 2],
    ].toSorted());
  });
});
