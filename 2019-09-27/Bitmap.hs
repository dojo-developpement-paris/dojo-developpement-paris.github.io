module Bitmap 

where
import MinHeap

type Coord = (Int,Int)
type Distance = (Int, Coord)
type Bitmap = [String]

distances :: [[Char]] -> [[Int]]
distances x = []


distance [row] = [dist 0 row]
    where
    dist n [] = []
    dist n (c:cs) = n : dist (n+1) cs 

initial :: Bitmap -> MinHeap Distance
initial rows = foldr add emptyHeap ds
    where
    ds =  concat [ initialRow j (rows!!j) | j <- [0..length rows-1]]
    initialRow j row = [(0,(j,i)) | i <- [0..length row - 1], row !! i == '1' ]

addAdjacents :: MinHeap Distance -> Bitmap -> MinHeap Distance
addAdjacents h bm = 
    let ( (d,(i,j)) , h') = extractMin h
        as = filter (\(d,(x,y)) -> x>=0 && y >=0 && x < length bm && y < length (head bm) ) [( d+1, (x,y)) | (x,y) <- [(i,j-1),(i-1,j),(i,j+1),(i+1,j)]]
    in foldr add h' as 
