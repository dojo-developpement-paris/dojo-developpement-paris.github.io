/*
  20 5 /        => 20/5 = 4
  4 2 + 3 -     => (4+2)-3 = 3
  3 5 8 * 7 + * => ((5*8)+7)*3 = 141
*/

const operators = {
    "*": (x, y) => x * y,
    "+": (x, y) => x + y,
    "/": (x, y) => x / y,
};

const rpn = (expression) => {
    const stack = []

    if (!expression.includes(" ")) {
        stack.push(parseInt(expression))
    }
    else {
        const [operand1, operand2, operator, ...rest] = expression.split(" ");
        const operation = operators[operator];
        let result = operation(parseInt(operand1), parseInt(operand2));

        stack.push(result)

        if (rest.length > 0) {
            const [operand3, operator2] = rest;
            const operation2 = operators[operator2];
            const last = stack.pop()
            stack.push(operation2(last, parseInt(operand3)));
        }
    }

    return stack.pop();
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
    it("can divide two operands", () => {
        expect(rpn("32 4 /")).toBe(8);
    });
    it("can calculate with more than 2 operands", () => {
        expect(rpn("4 2 + 3 +")).toBe(9);
    })
});
