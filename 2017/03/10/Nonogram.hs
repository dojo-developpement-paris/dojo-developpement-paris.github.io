module Nonogram
where
import Data.List (transpose)
import Data.List.Split (chunksOf)

type Column = Dimension
type Row    = Dimension
type Dimension = [Int]
type Image  = [String]

solve :: [Column] -> [Row] -> Image
solve cs rs = chunksOf (length cs) $ map match l
    where
    match (x,y) | x == y = x
                | otherwise = ' '
    dc = solveDimension cs
    dr = solveDimension rs
    l = [(x,y) | x <- dc, y<- dr]

solveDimension :: [Dimension] -> String
solveDimension [[_]] = "#"
solveDimension [[ ]] = " "
solveDimension [[ ],[ ]] = "  "
solveDimension [[_],[ ]] = "# "
solveDimension [[ ],[_]] = " #"
solveDimension l = map detect l
    where detect []  = ' '
          detect [_] = '#'

