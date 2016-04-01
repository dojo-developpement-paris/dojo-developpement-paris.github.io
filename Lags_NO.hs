module Lags
where
import Data.List (sort)

type Order = (Time, Duration, Money)
type Time = Integer
type Duration = Integer
type Money = Integer

value :: [Order] -> Money
value os = value' (sort os) 

value' :: [Order] -> Money
value' [] = 0
value' (o:os) = max first (value' os)
    where
        first = bid o + value' (filter (compatible o) os)

compatible :: Order -> Order -> Bool
compatible o o' = end o <= start o'

bid :: Order -> Money
bid (_,_,b) = b

end :: Order -> Time
end (s,d,_) = s+d

start :: Order -> Time
start (s,_,_) = s



