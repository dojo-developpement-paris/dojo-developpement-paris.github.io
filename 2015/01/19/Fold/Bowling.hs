module Bowling
where

type Bonus  = Integer 
type Score  = Integer
type Frame  = Integer
type Roll   = Integer

data RollType = Strike | Spare | Second | First 
    deriving (Eq,Show) 

nobonus = 00
bSpare  = 01 
bStrike = 11
bDouble = 12

newScore :: Score -> Bonus -> Frame -> Roll -> Score
newScore s b f r = s + r * (factor b + stillInGame f) 
    where
    factor b = b `mod` 10 

stillInGame :: Frame -> Integer
stillInGame 10 = 0
stillInGame _  = 1

rollType :: Maybe Roll -> Roll -> RollType
rollType Nothing 10 = Strike  
rollType Nothing  _ = First 
rollType (Just x) y | x+y == 10  = Spare
rollType (Just _) _ = Second

newBonus :: Bonus -> RollType -> Frame -> Bonus
newBonus b rt f  = b `div` 10 + (stillInGame f) * bonusRollType rt
    where bonusRollType Strike = bStrike
          bonusRollType Spare  = bSpare
          bonusRollType _      = nobonus

adjustFrame :: Frame -> Roll -> RollType -> (Frame, Maybe Roll) 
adjustFrame f r First   = (f, Just r)
adjustFrame 10 r _       = (10, Just r) 
adjustFrame f r _       = (f+1, Nothing) 

type State = (Score, Frame, Maybe Roll, Bonus) 

newState :: State -> Roll -> State
newState (sc,fr,lr,b) r = (newScore sc b fr r, 
                           fr',
                           lr',
                           newBonus b rt fr)
        where (fr',lr') = adjustFrame fr r rt 
              rt        = rollType lr r   

bowlingScore :: [Roll] -> Score
bowlingScore rs = sc
    where (sc,_,_,_) = foldl newState (0,0,Nothing,nobonus) rs
