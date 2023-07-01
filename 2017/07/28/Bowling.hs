module Bowling where

type Throw = Int
type Score = Int
type Bonus = Int

type GameState = (Score, Bonus, Maybe Throw)

initial :: GameState
initial = (0,0,Nothing)

score (s,_,_) = s

addScore :: GameState -> Throw -> GameState
addScore (init,bonus,lastThrow) throw =
    (init + throw + bonus * throw,
     case lastThrow of
        Nothing -> 0
        Just lt -> case lt + throw of
             10 -> 1
             _  -> 0,
     case lastThrow of
        Nothing -> Just throw
        _       -> Nothing)
