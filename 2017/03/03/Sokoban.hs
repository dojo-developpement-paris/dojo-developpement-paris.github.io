module Sokoban
where
import Data.Map as M
import Data.List as L

type Puzzle = Map Coord Element

type Coord = (Integer,Integer)

data Element = Wall | Space | Filled | Goal | Crate | Worker
    deriving (Eq,Show)

data Direction = West | North | East | South
    deriving(Eq, Show)

puzzle :: [String] -> Puzzle
puzzle p = fromList $ concatMap ixl (ix p)
    where
    ix = zip [0..]
    ixl (y,s) = [((x,y),element c) | (x,c) <- ix s]


at :: Puzzle -> Coord -> Element
at = (!)

element '#' = Wall
element ' ' = Space
element '*' = Filled
element '.' = Goal
element '$' = Crate
element '@' = Worker

move :: Puzzle -> Direction -> Puzzle
move p d = case p!(x',y') of
        Space -> q
        _     -> p
    where
    (x',y') = case d of
             West -> (x-1,y)
             East -> (x+1,y)
             South -> (x,y+1)
             North -> (x,y-1)
    p' = update (const (Just Space)) (x,y) p
    q = update (const (Just Worker)) (x',y') p'
    (x,y) = coordWorker p
    coordWorker = head . keys . M.filter (==Worker) 

display :: Puzzle -> [String]
display p = L.map (L.map character) $  es
    where
     (maxX,maxY) = fst $ findMax p
     cs = [(x,y) | y <- [0..maxY], x <- [0..maxX]]
     ccs = L.groupBy (same snd) cs
     es = L.map (L.map (at p)) ccs
     same f a b = f a == f b 

character :: Element -> Char
character Wall = '#'
character Space = ' '
character Filled = '*'
character Goal = '.'
character Crate = '$'
character Worker = '@'

