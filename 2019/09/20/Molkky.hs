module Molkky where
import Data.List (sortBy)
import Data.Ord (comparing)

type Quill = Int
type Score = Int
type Name = String
type Player = (Name, Score)
type Throw = [Quill]
type Round = (Name, Throw)
type Ranking = [Player]

throwScore :: Throw -> Score
throwScore [x] = x
throwScore xs = length xs

plays :: Player -> Throw -> Player
plays (n,s) x | newScore <= 50 = (n, newScore)
              | otherwise = (n, 25)
        where
            newScore = s + throwScore x

rank :: [Round] -> Ranking
rank = reverse . sortBy (comparing snd) . map score 
    where 
        score :: Round -> Player
        score (n,r) = (n,0) `plays` r
