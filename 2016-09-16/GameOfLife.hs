module GameOfLife where

type Grid = [[Cell]]
data Cell = Dead | Live
    deriving (Eq, Show, Enum)

nextGeneration :: Grid -> Grid
nextGeneration [line] = [map life (zip line (countNeighbors line))]
    where
        life (Live,2) = Live
        life _        = Dead
        
nextGeneration g = map (map (const state)) g
    where state | countLiveCells g >= 3 = Live
                | otherwise             = Dead


countNeighbors :: [Cell] -> [Int]
countNeighbors l = zipWith (+) (0:l') (tail l'++[0])
    where l' = map fromEnum l 
    
countLiveCells :: Grid -> Int
countLiveCells g = sum (map (length.filter (==Live)) g)

grid :: Int -> Int -> Cell -> Grid
grid h w state = replicate h (replicate w state) 

