/*
  20 5 /        => 20/5 = 4
  4 2 + 3 -     => (4+2)-3 = 3
  3 5 8 * 7 + * => ((5*8)+7)*3 = 141
*/

const rpn = (expression) => {
    const [operand1,operand2,operator] = expression.split(" ");
    if(operator==="+") {
        return parseInt(operand1) + parseInt(operand2);
    }
    if(operator==="*") {
        return parseInt(operand1) * parseInt(operand2);
    }
    return parseInt(expression);
};

describe("rpn calc", () => {
    it("works for a simple operand", () => {
        expect(rpn("42")).toBe(42);
        expect(rpn("17")).toBe(17);
    });
    it("can add two operands", () => {
        expect(rpn("1 1 +")).toBe(2);
        expect(rpn("2 2 +")).toBe(4);
        expect(rpn("3 4 +")).toBe(7);
        expect(rpn("10 1 +")).toBe(11);
    })
    it("can multiply two operands", () => {
        expect(rpn("3 4 *")).toBe(12);
    });
});
