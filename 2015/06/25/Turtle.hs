module Turtle
where
import Data.List (nub)

type Turtle = (Coords,Angle)
type Coords = (Double,Double)
type Angle = Double

data Command = FD Double | TL Double | TR Double
    deriving (Show)

turtle :: Turtle
turtle = ((0,0),0)

coords :: Turtle -> Coords
coords (cs,_) = cs

execute :: Turtle -> Command -> Turtle
execute ((x,y),a) (FD d)  = ((x+d*cos a,y+d*sin a),a)
execute (cs,a) (TL d) = (cs, a + d)
execute (cs,a) (TR d) = (cs, a - d)

svgPath :: [Coords] -> String
svgPath (c:cs) = embed $ unwords $ moveto c : map lineto cs
    where
    moveto (x,y) = 'M' : (show x ++ " " ++ show y)
    lineto (x,y) = 'L' : (show x ++ " " ++ show y) 
    embed s = "<path d=\""++s++"\" />"

trace :: [Command] -> String
trace cmds = svgPath $ map coords $ scanl execute turtle cmds
    



