module Lags
where
import Data.List (sortBy)
import Data.Map (Map,empty, insertWith, findWithDefault)

type Order = (Time, Duration, Money)
type Time = Integer
type Duration = Integer
type Money = Integer

data Event = Cash Time | Rent Time Time Money
    deriving (Eq, Ord, Show) 

events :: [Order] -> [Event]
events os = sortBy timeThenKind (concatMap toEvents os)
    where toEvents :: Order -> [Event]
          toEvents (s,d,b) = [Cash s, Rent s (s+d) b, Cash (s+d)]
          timeThenKind :: Event -> Event -> Ordering
          timeThenKind e e' | time e == time e' = compare e e'
                            | otherwise         = compare (time e) (time e')
time :: Event -> Time
time (Cash s) = s
time (Rent s _ _) = s



type Table = Map Time Money

values :: [Event] -> (Money,Table)
values = foldl update (0,empty) 
    where 
    update :: (Money,Table) -> Event -> (Money,Table)
    update (m,table) (Cash t) = (max m (findWithDefault 0 t table), table)
    update (m,table) (Rent s e b) = (m, insertWith max e (m+b) table)

value :: [Event] -> Money
value = fst . values
