module Lags
where
import Data.Map ((!),empty,assocs,Map,insert)

type Time = Int
type Money = Int
type Flight = (Time, Money)
type Plan = Map Time [Flight]
type ProfitTable = Map Time Money

money :: Flight -> Money
money = snd

time :: (Time, [Flight]) -> Time
time = fst

flights :: (Time,[Flight]) -> [Flight]
flights = snd

profit :: Plan -> Money
profit p = snd (profit' p)

profit' :: Plan -> (ProfitTable,Money)
profit' p = foldl maxAt (empty,0) (assocs p)
    where maxAt :: (ProfitTable,Money) -> (Time,[Flight]) -> (ProfitTable,Money)
          maxAt (table,currentMax) e = (insert (time e) newMax table, newMax) 
            where 
                newMax = max currentMax (profitAt table e)

profitAt :: ProfitTable -> (Time, [Flight]) -> Money
profitAt table node = (maximum . (0:) . map bestMoney . flights) node
    where
    bestMoney :: Flight -> Money
    bestMoney (s, p) = bestProfitAt s + p

    bestProfitAt :: Time -> Money
    bestProfitAt s = table!s 


