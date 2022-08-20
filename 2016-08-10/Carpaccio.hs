module Carpaccio where
import Data.List (find)

rounded :: Double -> Double
rounded = (/ 100.0) . fromInteger . round . (* 100.0)

totalPrice :: Double -> Double
totalPrice = rounded . (* 1.0685)

isMoney :: Double -> Bool
isMoney n = rounded n == n  

result = either id show

printTotal :: String -> String 
printTotal s = result $ arg s >>= parse >>= range >>= money >>= (return . totalPrice)

first = find (const True)

parse = maybe (Left "not a number") Right .  first . map fst . reads 

arg = maybe (Left "missing number") Right . first . words

money n = if isMoney n then Right n else Left "not a price"

range n = if n > 100000 then Left "out of range" else Right n

process f = unlines . map f . lines

