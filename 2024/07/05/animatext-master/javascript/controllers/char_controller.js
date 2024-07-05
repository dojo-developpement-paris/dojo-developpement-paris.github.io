import RandomChar from "../models/random_char_model.js"


class CharController {
    constructor(domElem) {

        this.domElem =      domElem;
        this.animationEnd = false;
        this.#initCharController();
    }

    #initCharController() {
      this.randomChar = null;
      this.charCount =  0;
    }


    randomLetterLoop = ({renderedText, nextLetter}) => { // recursion
        return new Promise(async(resolve) => {

            if (this.animationEnd) return resolve(true);

            this.randomChar = new RandomChar();
            this.animationEnd = await this.#intervalForRandomChar({renderedText: renderedText, nextLetter: nextLetter});

            return resolve(this.randomLetterLoop({renderedText: renderedText, nextLetter: nextLetter}));
        })
    }

    #intervalForRandomChar = ({renderedText, nextLetter}) => {
        return new Promise((resolve) => {
            setTimeout(() => {

                if (this.charCount === 3) {

                    this.domElem.insertCharToParagraph({renderedText: renderedText, char: nextLetter})
                    this.charCount = 0;
                    resolve(true)

                } else {

                    this.domElem.insertCharToParagraph({renderedText: renderedText, char: this.randomChar.char})
                    this.charCount++
                    resolve(false);

                }

            }, 20)
        })
    }
}

export default CharController
