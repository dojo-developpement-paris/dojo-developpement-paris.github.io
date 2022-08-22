module FizzBuzz
where

fizzBuzz :: Int -> [String]          
fizzBuzz max = map define [1..max]
    where 
    define x = if null res then show x else res
        where 
        res = apply x [(3, "fizz"), (5, "buzz"),(7,"foo")]


isMultipleOf :: Int -> Int -> Bool
isMultipleOf x y = mod x y == 0

apply :: Int -> [(Int,String)] -> String
apply n [] = ""
apply n ((m,s):rs) | n `isMultipleOf` m = s ++ apply n rs
                   | otherwise = apply n rs 




