class TextModel {
    constructor(text) {
        this.initialText = text
        this.content = this.initialText
        this.renderedText = null
        this.nextLetter = null
    }

    setRenderedTextAndNextLetter = ({counter}) => {
        this.renderedText = this.content.substring(0, counter)
        this.nextLetter = this.initialText[counter]
    }

    //Créer une fonction qui renvoie
}

export default TextModel
