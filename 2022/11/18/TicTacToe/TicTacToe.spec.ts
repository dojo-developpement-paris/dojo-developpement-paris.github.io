const ticTacToe = () => State.RUNNING

class TicTacToe {
    getState() : State {
        return State.O_WINS
    }
    moves(params:[number, number][]) {
        
    }
}

enum State {RUNNING = "Running", O_WINS = "0 has won"}

describe("Test configuration", () => {
    it("works correctly", () => {
        expect(true).toBe(true)
    })
})

describe("Tic Tac Toe", () => {
    it("is initially in state running", () => {
        const game = new TicTacToe();
        const actual = game.getState();
        const expected = State.RUNNING; 
        expect(actual).toEqual(expected);
    })
    it("null -> \"Running\"", () => {
        const actual = ticTacToe();
        expect(actual).toEqual("Running");
    })
    it("9 games are done -> O is winning", () => {
        const game = new TicTacToe()
        game.moves([[0,0], [0,2], [1,1], [2,1], [2,2]]);

        const actual = game.getState();
        const expected = State.O_WINS
        expect(actual).toEqual(expected)
    })
})