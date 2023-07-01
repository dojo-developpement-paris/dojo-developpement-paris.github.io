module Lib
    ( diamond
    , letter
    ) where

import Data.Char

diamond :: Int -> [String]
diamond n =
    let half = [ replicate (2*n-1) (letter m) | m <- [0..(n-1)]]
    in half ++ tail (reverse half)

letter n = chr (65+n)
