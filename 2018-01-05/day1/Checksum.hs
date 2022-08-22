module Checksum where
import Data.Char

type Checksum = Int
type Digit = Int

checksum :: [Digit] -> Checksum
checksum xs = fst $ foldr reduction (0, head xs) xs 
     where reduction current (r, previous) | current == previous = (r + current, current) 
                                           | otherwise           = (r          , current)

parse :: String -> [Digit]
parse = fmap digitToInt 

