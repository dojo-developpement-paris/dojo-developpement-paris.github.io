import DOM_ELEMENT_UTILS from "../utilities/dom_elements.js"

class DomElementModel {

    constructor({tag}) {
        this.domElementBody = DOM_ELEMENT_UTILS.getDomElement(tag)
        this.elementToInsertLetterIn = null
        this.content = null
        this.#insertToBody()
    }

    insertCharToParagraph = ({renderedText = false, char}) => {
        renderedText ? this.elementToInsertLetterIn.innerText = renderedText + char : this.elementToInsertLetterIn.innerText = char
    }

    #insertToBody = () => {
        this.domElementBody.insertAdjacentHTML("afterbegin", DOM_ELEMENT_UTILS.insertDomElement({tag: "p", id:"letter"}))
        this.elementToInsertLetterIn = this.#getParagraph({id: "#letter"})
    }

    #getParagraph = ({id}) => DOM_ELEMENT_UTILS.getDomElement(id)
}

export default DomElementModel
