module Sandpile 
where

type Matrix = [[Int]]
type Coord = (Int,Int)

fill :: Int -> Matrix -> Coord -> Matrix 
fill max [[n,m]] _ | n == max = [[max,m+1]]
fill max [row] (_,y) | row!!y < max = [incrementAt y row]
                     | otherwise   = [(incrementAt (y+1) . incrementAt (y-1) . decrementAt y) row]
fill max m (x,y) =  [fillRow y (m!!x)] 

fillRow :: Int -> [Int] -> [Int]
fillRow y row = incrementAt y row ++ drop 1 row


incrementAt = change 1
decrementAt = change (-1) 
change :: Int -> Int -> [Int] -> [Int]
change n y row = take y row ++ [(row!!y)+n] ++ drop (y+1) row

