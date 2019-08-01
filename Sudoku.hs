module Sudoku where
import Data.List (transpose)

type Cell = Integer
type Row = [Cell]
type Grid = [Row]

isValid :: Grid -> Bool
isValid grid = all hasNoDuplicate (rows grid) && 
               all hasNoDuplicate (cols grid) 
--               all hasNoDuplicate (boxes grid)

    where hasNoDuplicate :: [Cell] -> Bool
          hasNoDuplicate []     = True
          hasNoDuplicate (cell:cells) = not (elem cell cells) && hasNoDuplicate cells

rows = id
cols = transpose
boxes _ = undefined
size = 2

chop :: [a] -> Int -> [[a]]
chop [] _ = []
chop xs n = (take n xs) : chop (drop n xs) n 

