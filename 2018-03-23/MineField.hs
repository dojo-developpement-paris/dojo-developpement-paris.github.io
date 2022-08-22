-- see http://cyber-dojo.org/kata/edit/ztyH78z2Um?avatar=fox

module MineField where
import Data.Char
import Data.List

type Neighbors = (Char,[Char])
label :: [String] -> [String]
label = map (map danger) . allNeighbors 

allNeighbors :: [String] -> [[Neighbors]]
allNeighbors grid = (map neighbors grid) 
                    `merge` transposed 
                    `merge` rightTransposed
                    `merge` leftTransposed
                    
    where 
    transposed = (transpose (map neighbors (transpose grid)))
    leftTransposed = map (\l -> tail l ++ [('.',[])]) transposed   
    rightTransposed = map (\l -> ('.',[]):l) transposed
    
neighbors :: String -> [Neighbors]
neighbors row = zipWith3 triplet row ('.':row) (tail row ++ ".")

triplet :: Char -> Char -> Char -> Neighbors
triplet cell left right = (cell,[left,right])
    
danger :: Neighbors -> Char
danger ('*',_) = '*'
danger ('.',neighbors) = intToDigit $ length $ filter (=='*') neighbors


merge :: [[Neighbors]] -> [[Neighbors]] -> [[Neighbors]]
merge a b = zipWith mergeLine a b
    where
    mergeLine :: [Neighbors] -> [Neighbors] -> [Neighbors]
    mergeLine = zipWith mergeCell 
    mergeCell :: Neighbors -> Neighbors -> Neighbors
    mergeCell (a,b) (_,c) = (a, b ++ c)
    
    
    
    
    
    
