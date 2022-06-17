const ALPHABET = ['#', '!', '$']

const initial = (size) => "#".repeat(size)

const nextCharacter = (c) => {
    const position = ALPHABET.indexOf(c)
    const nextPosition = (position + 1) % ALPHABET.length
    return ALPHABET[nextPosition]
}

const next = (value) => {
    const start = value.slice(0, -1)
    const last = value.at(-1)
    const end = nextCharacter(last)
    if (last === ALPHABET.at(-1))
        return next(start) + ALPHABET[0]

    return `${start}${end}`
}

describe('Counter', () => {
    describe('initial', () => {
        it('should give initial counter for a given length', () => {
            expect(initial(6)).toEqual('######')
            expect(initial(4)).toEqual('####')
        })

        it('should give an empty counter for a length of zero', () => {
            expect(initial(0)).toEqual('')
        })
    })

    describe('next', () => {
        it('increments a counter', () => {
            expect(next('####')).toBe('###!')
            expect(next('###!')).toBe('###$')
            expect(next('###')).toBe('##!')
        })

        it('increments the next position on counter', () => {
            expect(next('###$')).toBe('##!#')
            expect(next('##$$')).toBe('#!##')
        })
    })
})