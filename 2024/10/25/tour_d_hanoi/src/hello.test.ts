import { describe, expect, it } from "./dev_deps.ts";

const gauche = 0;
const milieu = 1;
const droite = 2;

const initialisation = () => [[3, 2, 1], [], []];

const move = (
  hanoi: number[][],
  disque: number,
  colonneDestination: number,
) => {
  const newLocal = [
    hanoi[0].filter((disc) => disc !== disque),
    [],
    hanoi[2].filter((disc) => disc !== disque),
  ];
  newLocal[colonneDestination].push(disque);
  return newLocal;
};

describe("Hanoi", () => {
  it("initialement la colonne de gauche contient les disques triés", () => {
    const colonnes = initialisation();
    const gauche = colonnes.at(0);
    const milieu = colonnes[1];
    const droite = colonnes[2];
    expect(gauche).toEqual([3, 2, 1]);
    expect(milieu.length).toBe(0);
    expect(droite.length).toBe(0);
  });

  it("un disque a été déplacé à droite", () => {
    const hanoi = initialisation();
    const hanoiNouveau = move(hanoi, 1, droite);
    expect(hanoiNouveau[droite].at(0)).toEqual(1);
    expect(hanoiNouveau[gauche]).toEqual([3, 2]);
  });

  it("un disque a été déplacé à gauche", () => {
    const hanoi = initialisation();
    const hanoiNouveau = move(hanoi, 1, droite);
    const hanoiNouveauNouveau = move(hanoiNouveau, 1, gauche);
    expect(hanoiNouveauNouveau[gauche]).toEqual([3, 2, 1]);
    expect(hanoiNouveauNouveau[droite]).toEqual([]);
  });
  it("un disque a été déplacé au milieu", () => {
    const hanoi = initialisation();
    const hanoiNouveau = move(hanoi, 1, milieu);
    expect(hanoiNouveau[milieu].at(0)).toEqual(1);
    expect(hanoiNouveau[gauche]).toEqual([3, 2]);
  });
});
