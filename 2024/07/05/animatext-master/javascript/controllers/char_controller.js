import RandomChar from "../models/random_char_model.js"
import { sleep } from "../utilities/sleep.js";


class CharController {
    constructor(domElem, numberOfAnimationCharsForCharacter) {

        this.domElem = domElem;
        this.animationEnd = false;
        this.numberOfAnimationCharsForCharacter = numberOfAnimationCharsForCharacter
        this.#initCharController();
    }

    #initCharController() {
        this.randomChar = null;
        this.charCount = 0;
    }


    randomLetterLoop = ({ renderedText, nextLetter }) => { // recursion
        return new Promise(async (resolve) => {

            if (this.animationEnd) return resolve(true);

            this.randomChar = new RandomChar();
            this.animationEnd = await this.#intervalForRandomChar({ renderedText, nextLetter });

            return resolve(this.randomLetterLoop({ renderedText, nextLetter }));
        })
    }

    #intervalForRandomChar = ({ renderedText, nextLetter }) => {
        let galette
        if (this.charCount === this.numberOfAnimationCharsForCharacter) {

            this.domElem.insertCharToParagraph({ renderedText, char: nextLetter })
            this.charCount = 0;
            galette = true

        } else {

            this.domElem.insertCharToParagraph({ renderedText, char: this.randomChar.char })
            this.charCount++
            galette = false

        }
        return sleep(20, galette)
    }
}

export default CharController
