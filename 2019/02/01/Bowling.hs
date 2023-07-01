module Bowling
where

score :: [Integer] -> Integer
score = score' 0 


score' :: Integer -> [Integer] -> Integer
score' 10 _ = 0
score' _ [] = 0
score' f (x:y:z:xs) | x == 10      = 10 + y + z + score' (succ f) (y:z:xs)
score' f (x:y:z:xs) | x + y == 10  = 10 + z + score' (succ f) (z:xs)
                    | otherwise    = x + y  + score' (succ f) (z:xs)
score' f [10,y] = 10 + y + score' (succ f) [y] 
score' f [x,y] = x + y

score' f [x]   = x
