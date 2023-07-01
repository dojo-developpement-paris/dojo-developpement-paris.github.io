module Koch exposing (..)
import List

type Move = Forward | Left | Right
type alias Point = (Float,Float)
type alias Angle = Float

split : Move -> List Move
split m = case m of
    Forward -> [Forward, Left, Forward, Right, Forward, Left, Forward]
    n       -> [n]


koch : Int -> List Move
koch n = case n of
    0 -> [Forward]
    n -> koch (n-1) |> List.concatMap split

roundCoords : Point -> Point 
roundCoords (x,y) = (roundCoord x, roundCoord y)

roundCoord : Float -> Float
roundCoord n = toFloat(round (n * 100)) / 100

turtle : Point -> Angle -> List Move -> List Point 
turtle (x,y) a ms = case ms of 
    [] -> [(x,y)]
    (Forward::moves) -> ((x,y)::turtle (x+cos a,y+sin a) a moves)
    (Left::moves)    -> turtle (x,y) (a+angle) moves
    (Right::moves)    -> turtle (x,y) (a-2*angle) moves

angle : Angle
angle = pi / 3

