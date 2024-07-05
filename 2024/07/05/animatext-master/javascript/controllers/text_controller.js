import Text from "../models/text_model.js"
import CharController from "./char_controller.js";

class TextController {
    constructor(text, domElem) {

        this.domElement = domElem
        this.text =       new Text(text);
        this.#initTextController();
    }

    #initTextController() {
        this.charController = null
        this.charCount =      0
    }

    textLoop = async () => {
        while (this.charCount < this.text.initialText.length) {
            this.text.setRenderedTextAndNextLetter({ counter: this.charCount });

            this.charController = new CharController(this.domElement);

            await this.charController.randomLetterLoop({
                renderedText: this.text.renderedText,
                nextLetter:   this.text.nextLetter
            });

            this.charCount++;
        }
    }
}

export default TextController
