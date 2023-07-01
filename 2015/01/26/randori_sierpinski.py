# triangles de sierpinski
from turtle import *


def sous_triangle(prof, l,a):
    triangle(prof,l)
    up()
    left(a)
    fd(l)
    left(360-a)
    down()
        
def triangle(prof,l):
    if prof == 0 :
        fd(l)
        left(120)
        fd(l)
        left(120)
        fd(l)
        left(120)

    else :
        hl = l/2

        sous_triangle(prof-1, hl, 0)
        sous_triangle(prof-1, hl, 120)
        sous_triangle(prof-1, hl, 240)

speed(0)
triangle(3,80)

    
