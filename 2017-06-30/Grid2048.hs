module Grid2048 where
import Data.List

data Direction = Left_ | Right_ | Down_ | Up_

compress c = concat (map pair (group (filter (/=0) c)))
    where
    pair [t,_]     = [t*2]
    pair [t]       = [t]
    pair [t,_,_]   = [t*2,t]
    pair [t,_,_,_] = [t*2,t*2]

pad c = take 4 (c ++ [0,0,0,0])

moveColumn = pad . compress

move Left_ = moveColumn
move Right_ = reverse . moveColumn . reverse

moveGrid Down_ = transpose . moveGrid Right_ . transpose
moveGrid Up_   = transpose . moveGrid Left_ . transpose
moveGrid d = map (move d)

insertTile t r c g | g!!r!!c == 0 = update r (update c t (g!!r)) g
                   | otherwise    = g
    where
    update p i l = take p l ++ [i] ++ drop (p+1) l  

tryInsertion t [] g = g
tryInsertion t ((r,c):ps) g | trial /= g = trial 
                            | otherwise  = tryInsertion t ps g
        where 
        trial = insertTile t r c g

