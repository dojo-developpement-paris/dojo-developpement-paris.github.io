module Bowling
where

score = score' 10 

score' 0    _ = 0
score' 1 [x,y] = x + y 
score' n (x:y:z:throws)
    | strike    = x + y + z + score' (n-1) (y:z:throws) 
    | spare     = x + y + z + score' (n-1) (z:throws)
    | otherwise = x + y     + score' (n-1) (z:throws)
    where 
        spare  = x+y == 10
        strike = x   == 10 
