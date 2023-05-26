module Life
  where

type Position = (Int, Int)
type Cell = Char
type Ground = [[Cell]]

evolve :: Ground -> Ground
evolve g@["o.oo"] = [map (evolveCell g) [(0, c) | c <- [0..length (head g) - 1]]]
evolve g | countAliveCells g == 3 = ["...",".o.","..."]
evolve _ = ["...","...","..."]

evolveCell :: Ground -> Position -> Cell
evolveCell g p | countAliveNeighbors g p == 2 = cellAt g p
evolveCell _ _ = '.'

countAliveCells :: Ground -> Int
countAliveCells g = sum (map (length . (filter (== 'o'))) g)


cellAt :: Ground -> Position -> Cell
cellAt _ (-1, _) = '.'
cellAt g (r, _) | r == length g = '.'
cellAt _ (_, -1) = '.'
cellAt g (_, c) | c == length (head g) = '.'
cellAt g (r, c) = g!!r!!c

countAliveNeighbors :: Ground -> Position -> Int
countAliveNeighbors g (row, col) =
  let ns = [(row - 1, col - 1), (row - 1, col), (row - 1, col + 1), (row, col - 1), (row, col + 1), (row + 1, col - 1), (row + 1, col), (row + 1, col + 1)]
   in length (filter (== 'o') (map (cellAt g) ns))


--
-- countAlive :: [Cell] -> Int
-- countAlive _ = 

-- truncateLine :: Ground -> [Cell]

-- 123456 => 123 234 345 456 => 123456 zip 23456 zip 3456 => 123 234 345 456
