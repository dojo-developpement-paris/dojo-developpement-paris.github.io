const DOM_ELEMENTS_INTERFACE = {
    insertDomElement: ({tag, id = null}) => !id ? `<${tag}></${tag}>` : `<${tag} id="${id}"></${tag}>`,
    getDomElement: (elem) => document.querySelector(elem)
}

export default DOM_ELEMENTS_INTERFACE
