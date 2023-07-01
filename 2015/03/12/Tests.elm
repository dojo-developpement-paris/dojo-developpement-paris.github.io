import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)
import List
import Baobab as B

round4 : Float -> Float
round4 n = toFloat (round (n * 10000)) / 10000 

roundCoords : (Float,Float) -> (Float,Float)
roundCoords (x,y) = (round4 x, round4 y)

tests = suite "fonctions Baobab" 
    [test "à partir d'un point et d'une taille, fait un carré sans base"
    <| assertEqual [(10,0),(10,10),(0,10),(0,0)] 
    <| B.carreSansBase (0,0) 10 
     ,
     test "à partir d'un point d'une taille et d'un angle, fait un triangle sans base"
     <| assertEqual [(2,0),(1,1),(0,0)]
     <| List.map roundCoords <| B.triangleSansBase (0,0) 2 (degrees 45) 

    , test "arrondi a 4 decimales" 
    <| assertEqual 3.1416 ( round4 pi)
    ,test "à partir d'un point d'une taille et d'un angle, fait une maison sans base"
    <| assertEqual [[(10,0),(10,10),(0,10),(0,0)],[(10,10),(5,15),(0,10)]]
    <| List.map (List.map roundCoords) (B.maisonSansBase (0,0) 10 (degrees 45))
    ,test "fait un baobab à 45 degrés de niveau 2 de taille 2"
    <| assertEqual [[(2,0),(2,2),(0,2),(0,0)]
                   ,[(2,2),(1,3),(0,2)]
                   ,[(1,3),(0,4),(-1,3)]
                   ,[(0,4),(-1,4),(-1,3)]
                   ,[(2,2),(3,3),(2,4),(1,3)]
                   ,[(3,3),(3,4),(2,4)]]
    <| List.map (List.map roundCoords) <| B.baobab45 2 (0,0) 2 
    , test "rotation d'une suite de points" 
    <| assertEqual [(0,0),(0,1)] 
    <| List.map roundCoords <| B.rotations (0,0) (degrees 90) [(0,0),(1,0)]

    ]  

main = runDisplay tests
