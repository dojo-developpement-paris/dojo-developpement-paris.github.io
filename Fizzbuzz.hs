module Fizzbuzz
where

fizzbuzz :: Int -> String
fizzbuzz n = case special n of
    "" -> show n
    s  -> s

type Transformation = String -> String -> String

special :: Int -> String
special n = foldl (specialCase n) "" [(3,"fizz", cumulate)
                                     ,(5,"buzz", cumulate)
                                     ,(7,"baaz", cumulate)
                                     ,(11,"foo", replace)]

specialCase :: Int -> String -> (Int,String,Transformation) -> String
specialCase n a (m,p,f)  = f a (applyPattern n m p)


cumulate :: Transformation
cumulate = (++)

replace :: Transformation
replace a "" = a    
replace a s  = s


applyPattern :: Int -> Int -> String -> String
applyPattern n m p | n `mod` m == 0  = p
                   | otherwise       = ""
