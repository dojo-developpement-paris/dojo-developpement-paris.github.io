module Lags
where

type Order = (Time,Duration,Money)
type Time  = Int
type Money = Int
type Duration = Int

value :: [Order] -> Money
value [] = 0
value (o:os) = max (money o + value suite) (value os)
    where
    suite = filter (`after` o) os

money :: Order -> Money
money (_,_,m) = m

time :: Order -> Time
time (t,_,_) = t

duration :: Order -> Duration
duration (_,d,_) = d

after :: Order -> Order -> Bool
o' `after` o = time o' >= time o + duration o

profit :: [Order] -> Money
profit = value 



