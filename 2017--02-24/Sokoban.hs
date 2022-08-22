module Sokoban
where

type Puzzle = [String]
type Object = Char
type Coord = (Int,Int)

data Command = Down | Up | Lt | Rt
    deriving (Eq,Show)

goal  = '.'
crate = '$'
space = ' '
worker = '@'

puzzle = id 

count :: Object -> Puzzle -> Int
count c = length . filter (== c) . concat

goals :: Puzzle -> Int
goals = count goal

crates :: Puzzle -> Int
crates = count crate

success :: Puzzle -> Bool
success = (0==) . goals


direction :: Command -> Coord -> Coord
direction Down (y,x) = (y+1,x)
direction Up   (y,x) = (y-1,x)
direction Lt   (y,x) = (y,x-1)
direction Rt   (y,x) = (y,x+1)

move :: Puzzle -> Command -> Puzzle
move p c  | allowed p c = replaceObject (replaceObject p yx space) (direction c yx) worker
          | otherwise   = p
    where
    yx = workerCoord p
    allowed p c = objectAt p (direction c yx) `elem` [space,crate]
    objectAt p (j,i) = p!!j!!i


workerCoord :: Puzzle -> Coord
workerCoord = workerCoord' (0,0) 
    where
    workerCoord' :: Coord -> Puzzle -> Coord
    workerCoord' _ [] = error "ill formed puzzle"
    workerCoord' (y,x) ([]:ss) = workerCoord' (y+1,0) ss
    workerCoord' (y,x) ((c:cs):ss) | c == worker = (y,x)
    workerCoord' (y,x) ((c:cs):ss) = workerCoord' (y,x+1) (cs:ss)


replace :: [a] -> Int -> a -> [a]
replace s p o = take p s ++ [o] ++ drop (p+1) s

replaceObject :: Puzzle -> Coord -> Object -> Puzzle
replaceObject p (y,x) o = replace p y newRow  
    where
    newRow = replace (p!!y) x o

