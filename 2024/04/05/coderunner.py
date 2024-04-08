from random import randint

def tableau(image, min, max):
    value_range = max - min
    couleur=[" ", ".", ":", "/", "X", "$"]
    for y in range(0, 50):
        for x in range(0, 50):
            valeur_a_afficher = image[y][x]
            index_de_la_couleur = int(((valeur_a_afficher-min)*(len(couleur)-1))/max)
            print(couleur[index_de_la_couleur], end='')
        print('')


image=[[]]*50
for y in range(0, 50):
    image[y] = [0]*50

min = 0
max = 255

def undanschaquecoin(carre):
    topLeft = randint(min, max)
    topRight = randint(min, max)
    bottomLeft = randint(min, max)
    bottomRight = randint(min, max)
    carre[0][0] = topLeft
    carre[0][49] = topRight
    carre[49][0] = bottomLeft
    carre[49][49] = bottomRight

def positionAuMilieu(image, xyA, xyB):
    xmin = min(xyA[0], xyB[0])
    xmax = max(xyA[0], xyB[0])
    xMilieu = xmin + (xmax - xmin) / 2
    ymin = min(xyA[1], xyB[1])
    ymax = max(xyA[1], xyB[1])
    yMilieu = ymin + (ymax - ymin) / 2
    return (xMilieu, yMilieu)

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

def moyenneCarre(image, topLeft, bottomRight):
    topRight = Point(bottomRight.x, topLeft.y)
    bottomLeft = Point()

undanschaquecoin(image)

tableau(image, min, max)