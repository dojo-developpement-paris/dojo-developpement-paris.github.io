import { describe, expect, it } from "./dev_deps.ts";

/*
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with more than three live neighbours dies, as if by overcrowding.
3. Any live cell with two or three live neighbours lives on to the next generation.
4. Any dead cell with exactly three live neighbours becomes a live cell.
*/

enum ÉtatCellule {
  VIDE = "VIDE",
  VIVANTE = "VIVANTE",
}

describe("Game of life", () => {
  it("un nouvel univers est vide pour une position donnée", () => {
    const univers = nouvelUnivers();
    expect(rechercheÉtatCellule(univers, [0, 0])).toEqual(ÉtatCellule.VIDE);
    expect(rechercheÉtatCellule(univers, [75, 44])).toEqual(ÉtatCellule.VIDE);
  });

  it("avoir une cellule vivante après une naissance", () => {
    const univers = ajouterUneCellule(nouvelUnivers(), [0, 0]);
    expect(rechercheÉtatCellule(univers, [0, 0])).toEqual(ÉtatCellule.VIVANTE);
    expect(rechercheÉtatCellule(univers, [75, 44])).toEqual(ÉtatCellule.VIDE);
  });

  it("avoir une cellule vivante après une naissance autre part", () => {
    const univers = ajouterUneCellule(nouvelUnivers(), [0, 1]);
    expect(rechercheÉtatCellule(univers, [0, 0])).toEqual(ÉtatCellule.VIDE);
    expect(rechercheÉtatCellule(univers, [0, 1])).toEqual(ÉtatCellule.VIVANTE);
  });
});

type Coordonnées = [number, number];
type CléCoordonnées = `${number},${number}`;
type Univers = Set<CléCoordonnées>;

const nouvelUnivers = (): Univers => new Set();

const rechercheÉtatCellule = (univers: Univers, coordonnées: Coordonnées) =>
  univers.has(clé(coordonnées)) ? ÉtatCellule.VIVANTE : ÉtatCellule.VIDE;

const ajouterUneCellule = (
  _univers: Univers,
  coordonnées: Coordonnées,
): Univers => new Set<CléCoordonnées>().add(clé(coordonnées));

const clé = ([x, y]: Coordonnées): CléCoordonnées => `${x},${y}`;
