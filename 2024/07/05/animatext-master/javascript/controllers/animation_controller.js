import DomElement from "../models/dom_element_model.js"
import { sleep } from "../utilities/sleep.js"
import TextController from "./text_controller.js"

class AnimationController {
    constructor({ texts = [], numberOfAnimationCharsForCharacter }) {
        this.domElement = new DomElement({ tag: "body" })
        this.texts = texts
        this.numberOfAnimationCharsForCharacter = numberOfAnimationCharsForCharacter
        this.#initAnimationController()

    }

    #initAnimationController = () => {
        this.textController = null;
        this.animationCount = 0;
    }

    // Créer une fonction qui appelle textLoop en envoyant le texte
    animationsLoop = async () => {
        if (this.animationCount === this.texts.length) return;

        this.textController = new TextController(this.texts[this.animationCount], this.domElement, this.numberOfAnimationCharsForCharacter)
        await this.textController.textLoop()
        await sleep(1100)
        this.animationCount++
        return this.animationsLoop()
    }
}

export default AnimationController
