module Primes where

primes = 2:([3..] `minus` composites)

divisors n = [d | d <- takeWhile (<= root n) primes,  n `mod` d == 0]
    where
    root = truncate . sqrt . fromIntegral

multiples n = map (*n) [n..]

merge (x:xs) ys = x:merge' xs ys
    where
    merge' (a:as) (b:bs) | a <  b = a : merge' as (b:bs)
                         | a == b = a : merge' as bs 
                         | otherwise = b : merge' (a:as) bs 

union :: [[Int]] -> [Int]
union = foldr merge []

composites = union [multiples n | n <- primes]

minus (x:xs) (y:ys) | x < y  = x : minus xs (y:ys)
                    | x == y = minus xs ys
                    | x > y  = minus (x:xs) ys
