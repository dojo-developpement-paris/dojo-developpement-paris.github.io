import sys


def voisins(mot, liste_de_mots):
    return [autre_mot
            for autre_mot
            in liste_de_mots
            if sont_adjacents(mot, autre_mot)]


def sont_adjacents(a, b):
    differences = 0
    for (la, lb) in zip(a, b):
        if la != lb:
            differences += 1
    return differences == 1

def ajoute(mot, liste_de_mots):
    return liste_de_mot + [mot]


if __name__ == "__main__":
    maybe_first_argument = next(iter(sys.argv[1:]), None)
    print(hello(maybe_first_argument))
