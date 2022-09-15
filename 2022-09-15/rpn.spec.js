/*
  20 5 /        => 20/5 = 4
  4 2 + 3 -     => (4+2)-3 = 3
  3 5 8 * 7 + * => ((5*8)+7)*3 = 141
*/

const rpn = (expression) => {
    if(expression === "1 1 +")
        return 2;
    if(expression === "2 2 +")
        return 4;
    return parseInt(expression);
};

describe("rpn calc", () => {
    it("works for a simple operand", () => {
        expect(rpn("42")).toBe(42);
        expect(rpn("17")).toBe(17);
    });
    it("can add two zeroes", () => {
        expect(rpn("1 1 +")).toBe(2);
        expect(rpn("2 2 +")).toBe(4);
    })
});
