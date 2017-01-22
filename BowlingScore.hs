module BowlingScore
where

type Throw = Integer
type Score = Integer
type FrameIndex = Integer

score :: [Throw] -> Score
score ts = score' 0 ts

score' :: FrameIndex -> [Throw] -> Score
score' 10 _ = 0
score' f (x:y:z:ts) | x   == 10 = x + y + z + score' (f+1) (y:z:ts)
                    | x+y == 10 = x + y + z + score' (f+1) (z:ts)
                    | otherwise = x + y +     score' (f+1) (z:ts)
score' f (x:y:ts)   | x   == 10 = x + y + score' (f+1) (y:ts)
score' f ts = sum ts

type FrameScore = Score
type Bonus = Integer
type Bonuses = (Bonus,Bonus)
type GameState = (FrameIndex, Score, Maybe FrameScore, Bonuses)

initial :: GameState
initial = (0, 0, Nothing, (0,0))

add :: GameState -> Throw -> GameState
add (f, sc, Nothing,     (b1,b2)) t | t == 10        = (f+1, newScore, Nothing, newBonus )
    where
    newBonus | f < 10    = (b2+1,1)
             | otherwise = (b2,0)
    bonus = t * b1
    newScore | f < 10    = sc + t + bonus
             | otherwise = sc +     bonus 

add (f, sc, (Just last), (b1,b2)) t | last + t == 10 = (f+1, newScore, Nothing, (b2+1,0))
                                    | otherwise      = (f+1, newScore, Nothing, (0,0))
    where
    bonus = t * b1
    newScore = sc + t + bonus

add (f, sc, Nothing , (b1,b2)) t = (f  , sc + t + t * b1, Just t, (b2,0))

throws :: [Throw] -> GameState
throws ts = foldl add initial ts

score'' :: [Throw] -> Score
score'' ts = sc where (_,sc,_,_) = throws ts 
