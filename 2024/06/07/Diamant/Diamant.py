from textwrap import dedent

def afficherDiamant(taille: int):
    if taille == 2:
        resultat = (" " + nieme_lettre(taille-1) + "\n" +
                              "B B" +              "\n" +
                    " " + nieme_lettre(taille-1))
        return resultat
    if taille == 3:
        pieces = [ str.rstrip(string) for string  in [ tuple[0]+tuple[1] for tuple in list(zip(assume_this(3), [a[::-1][1:] for a in assume_this(3)]))] +  [ tuple[0]+tuple[1] for tuple in list(zip(assume_this(3), [a[::-1][1:] for a in assume_this(3)]))][::-1][1:]]
        return '\n'.join(pieces)
    return nieme_lettre(taille)

def nieme_lettre(n):
    return chr(64+n)

def assume_this(n: int):
    return  [ (' '*(n-1-index)) + chr(65+a) + (' '* index) for index, a in enumerate(range(n))]


