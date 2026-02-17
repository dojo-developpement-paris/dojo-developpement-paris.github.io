import { describe, test, expect } from "vitest";

const crepe = (crepes:number[]) => crepes.length == 0 ? crepes : spatule(crepes, 2);

const spatule = (crepes:number[], position: number, crepesRetournées: number[] = []) => {
    if (position == 0) return [...crepesRetournées, ...crepes]

    const [a, ...reste] = crepes
    return spatule(reste, position-1, [a, ...crepesRetournées])

}

describe("les crepes", () => {
    test("tri sans crepe", () => {
        expect(crepe([])).toEqual([])
    })
    test("2 crepes différentes", () => {
        expect(crepe([2, 1])).toEqual([1, 2])

    })
    test("3 crepes différentes", () => {
        expect(crepe([2, 1, 3])).toEqual([1, 2, 3])
    })
})

describe("spatule", () => {
    test("Retourne aucune crepe", () => {
        expect(spatule([], 0)).toEqual([])
    })
    test("Retourne une crepe", () => {
        expect(spatule([2], 1)).toEqual([2])
    })
    test("Retourne deux crepes", () => {
        expect(spatule([2, 1], 2)).toEqual([1, 2])
        expect(spatule([3, 1], 2)).toEqual([1, 3])
    })
    test("Retourne deux parmi trois crepes", () => {
        expect(spatule([3, 2, 1], 2)).toEqual([2, 3, 1])
    })
    test("Retourne trois parmi trois crepes", () => {
        expect(spatule([3, 2, 1], 3)).toEqual([1, 2, 3])
    })
    test("Retourne trois parmi quatre crepes", () => {
        expect(spatule([3, 2, 1, 4], 3)).toEqual([1, 2, 3, 4])
    })
    test("Retourne cinq parmi sept crepes", () => {
        expect(spatule([3, 2, 1, 4, 5, 7, 6], 5)).toEqual([5, 4, 1, 2, 3, 7, 6])
    })
})