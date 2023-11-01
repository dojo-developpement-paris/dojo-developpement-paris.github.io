module GameOfLife
    where

import Data.Set as S ( Set, empty, insert, member )

type Coord = (Int, Int)

type CoordSet = Set Coord

data CellState = Dead | Alive
    deriving (Show, Eq)

data World = World { coords :: CoordSet }
    deriving (Eq, Show)

emptyWorld = World { coords = S.empty }

cellState :: World -> Int -> Int -> CellState
cellState w x y = if S.member (x,y) (coords w) 
                        then Alive 
                        else Dead

setAliveCell :: World -> Int -> Int -> World
setAliveCell w x y = World { coords = coords' }
    where
        coords' = S.insert (x,y) (coords w) 

generateWorld :: [Coord] -> World  -- pssst : use S.fromList !!
generateWorld cs = foldl f emptyWorld cs 
    where
        f :: World -> Coord -> World
        f w (x,y) = setAliveCell w x y

generation :: World -> World
generation _ = emptyWorld




