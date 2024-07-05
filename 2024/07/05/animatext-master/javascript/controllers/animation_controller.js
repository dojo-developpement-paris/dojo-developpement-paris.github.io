import DomElement from "../models/dom_element_model.js"
import TextController from "./text_controller.js"

class AnimationController {
    constructor(texts = []) {
        this.domElement =     new DomElement({tag: "body"})
        this.texts =          texts
        this.#initAnimationController()

    }

    #initAnimationController = () => {
      this.textController = null;
      this.animationCount = 0;
    }

    // Créer une fonction qui appelle textLoop en envoyant le texte
    animationsLoop = async () => {
        if (this.animationCount === this.texts.length) return;

        this.textController = new TextController(this.texts[this.animationCount], this.domElement)
        await this.textController.textLoop()
        await this.#waitTextToBeRead()
        this.animationCount++
        return this.animationsLoop()
    }

    #waitTextToBeRead = () => {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve();
            }, 1100);
        })
    }
}

export default AnimationController
