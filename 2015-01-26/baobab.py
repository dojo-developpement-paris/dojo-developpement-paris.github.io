from turtle import *

def baobab(prof, l):
    if prof == 0:
        #fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        right(60)
        fd(l*cos(60*pi/180))
        left(90)
        fd(l*sin(60*pi/180))
        right(90)
    if prof == 1 :
        #fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        left(90)
        fd(l)
        right(60)
        right(90)
        baobab(prof - 1, l*cos(60*pi/180))
        #left(90)
        #fd(l*sin(60*pi/180))
        #right(90)
        
        
        
    

speed(1)
#left(180)
baobab(1, 40)
