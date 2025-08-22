module Numeral where

data Romans = M | D | C | L | X | V | I
    deriving (Show)

toSymbol :: Int -> Romans
toSymbol 1000 = M
toSymbol 500 = D
toSymbol 100 = C
toSymbol 50 = L
toSymbol 10 = X
toSymbol 5 = V
toSymbol 1 = I
toSymbol _ = undefined

values :: [Int]
values = [1000, 500, 100, 50, 10, 5, 1]

toRoman :: Int -> String
toRoman x | x `elem` values = show $ toSymbol x
toRoman x | x == 1000 - 100 = toRoman 100 ++ toRoman 1000
toRoman x | x == 500 - 100 = toRoman 100 ++ toRoman 500
toRoman x | x == 100 - 10 = toRoman 10 ++ toRoman 100
toRoman x | x == 50 - 10 = toRoman 10 ++ toRoman 50
toRoman x | x == 10 - 1 = toRoman 1 ++ toRoman 10
toRoman x | x == 5 - 1 = toRoman 1 ++ toRoman 5
toRoman x | x > 1000 = toRoman 1000 ++ toRoman (x - 1000)
toRoman x | x > 900 = toRoman 900 ++ toRoman (x - 900)
toRoman x | x > 500 = toRoman 500 ++ toRoman (x - 500)
toRoman x | x > 400 = toRoman 400 ++ toRoman (x - 400)
toRoman x | x > 100 = toRoman 100 ++ toRoman (x - 100)
toRoman x | x > 90 = toRoman 90 ++ toRoman (x - 90)
toRoman x | x > 50 = toRoman 50 ++ toRoman (x - 50)
toRoman x | x > 40 = toRoman 40 ++ toRoman (x - 40)
toRoman x | x > 10 = toRoman 10 ++ toRoman (x - 10)
toRoman x | x > 5 = toRoman 5 ++ toRoman (x - 5)
toRoman x = take x $ cycle $ toRoman 1
