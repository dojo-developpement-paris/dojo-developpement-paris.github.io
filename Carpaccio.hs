module Carpaccio
where

type Quantity = Int
type Money    = Double
type Code     = String
type Rate     = Double

times :: Quantity -> Money -> Money
times q p = (fromIntegral q) * p 

discount :: Money -> Money
discount n | n >= 50000 = n * 0.15
discount n | n >= 10000 = n * 0.10
discount n | n >=  7000 = n * 0.07
discount n | n >=  5000 = n * 0.05
discount n | n >=  1000 = n * 0.03
discount n | otherwise  = 0

rounded :: Money -> Money
rounded n = fromIntegral (truncate ((n+0.005) * 100)) / 100.0

taxRate :: Code -> Rate
taxRate "UT" = 6.85
taxRate "NV" = 8.00 
taxRate "TX" = 6.25
taxRate "AL" = 4.00
taxRate "CA" = 8.25

withDiscount :: Money -> Money
withDiscount n = n - (discount n)

taxIncluded :: Code -> Money -> Money
taxIncluded c n = n * ((100+taxRate c)/100)

total :: Quantity -> Money -> Code -> Money
total q p c = rounded (taxIncluded c (withDiscount (q `times` p)))
