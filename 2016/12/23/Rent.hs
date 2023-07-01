module Rent where
import Data.List
import Data.Maybe

type Order = (Time, Time, Money)
type Time  = Int
type Table = [(Int, Money)]
type Money = Int

m = 1000000

profit :: [Order] -> Money
profit os = price (last profits) 
    where
    profits = foldl calc [(m,0,0)] $ reverse $ sort $ os

    calc :: [Order] -> Order -> [Order]
    calc ps (t,d,p) = ps ++ [(t,d,best)]
        where
        best = max (p + price (last_compatible (t+d) ps)) (price (last ps))

        last_compatible end ps = last (filter (\(start,_,_) -> start >= end) ps)

price :: Order -> Money
price (_,_,p) = p

