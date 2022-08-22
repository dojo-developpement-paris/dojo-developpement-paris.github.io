module Bowling
where

type Throw = Integer
type Score = Integer
type Game  = (Score,Bonuses,Track,Frame)
type Frame = Integer
type Bonuses = (Bonus,Bonus)
type Bonus = Integer
type Track = Maybe Throw 

score :: [Throw] -> Score
score ts = score' (foldl addToScore (0,(0,0),Nothing,0) ts)
    where
    score' :: Game -> Score
    score' (s,_,_,_) = s

    addToScore :: Game -> Throw -> Game
    addToScore (sc,b,l, f)  t = (updateScore sc b t f
                                ,updateBonus t l b f
                                ,updateLastThrow l t
                                ,updateFrame l t f  )

    updateScore :: Score -> Bonuses -> Throw -> Frame -> Score
    updateScore sc (n,_) t f | f < 10    = sc + (1+n) * t
                             | otherwise = sc + n * t

    updateBonus :: Throw -> Maybe Throw -> Bonuses -> Frame -> Bonuses
    updateBonus 10 Nothing (_,n) 10 = (n,1)
    updateBonus 10 Nothing (_,n) f = (n+1,1)
    updateBonus t Nothing  (_,n) f = (n,0)
    updateBonus t (Just s) _ f | t+s == 10 = (1,0)
                               | otherwise = (0,0)

    updateLastThrow :: Track -> Throw -> Track
    updateLastThrow Nothing 10 = Nothing
    updateLastThrow Nothing  t = Just t
    updateLastThrow _        _ = Nothing

    updateFrame :: Track -> Throw -> Frame -> Frame
    updateFrame _ _ 10 = 10
    updateFrame Nothing 10 f = f+1
    updateFrame Nothing _  f = f
    updateFrame _       _  f = f+1
