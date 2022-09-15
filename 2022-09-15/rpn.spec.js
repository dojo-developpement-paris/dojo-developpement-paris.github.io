/*
  20 5 /        => 20/5 = 4
  4 2 + 3 -     => (4+2)-3 = 3
  3 5 8 * 7 + * => ((5*8)+7)*3 = 141
*/

const rpn = (expression) => {
    if(expression.includes('+')) {
        const [op1,op2,op] = expression.split(" ");
        return parseInt(op1) + parseInt(op2);
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
});
