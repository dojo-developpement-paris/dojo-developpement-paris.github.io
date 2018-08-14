module Bonus
where

data History = NewDriver
             | Anniversary History
             | Accident History
    
data Bonus = Bonus Float
    deriving (Show, Eq)

rounded n =(fromIntegral (floor (n*100))) / 100 

bonus :: History -> Bonus

bonus NewDriver = Bonus 1 

bonus (Anniversary (Accident driver)) = bonus (Accident driver) 

bonus (Accident driver) =
    let (Bonus x) = bonus driver
    in Bonus (rounded (x * 1.25))

bonus (Anniversary driver) = 
    let (Bonus x) = bonus driver 
    in Bonus (rounded (x * 0.95))

