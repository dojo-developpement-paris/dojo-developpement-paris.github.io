module Bowling
where

type Score = Int 
type Throw = Int
type FrameCount = Int

score = score' 0

score' :: FrameCount -> [Int] -> Score
score' 10 ts = 0
score' f (10:z:[])  = 10 + z     + score' (f+1) [z]
score' f (x:y:z:ts) | strike    = 10 + y + z + score' (f+1) (y:z:ts)
                    | spare     = x + y + z + score' (f+1) (z:ts) 
                    | otherwise = x + y +   score' (f+1) (z:ts)
       where
        spare = x + y == 10 
        strike = x == 10
score' f ts = sum ts

