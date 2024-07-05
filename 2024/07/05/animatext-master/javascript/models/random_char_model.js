import MATH from "../utilities/math.js"

class RandomCharModel {
    constructor() {
        this.char = this.generateRandomChar()
    }
    generateRandomChar = () => {
        return String.fromCharCode(this.#generateRandomCharCode({maxNum: 97}))
    }
    #generateRandomCharCode = ({maxNum}) =>  MATH.randomInt(maxNum) + 32
}

export default RandomCharModel
