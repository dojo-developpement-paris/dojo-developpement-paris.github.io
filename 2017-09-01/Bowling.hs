module Bowling (score) where

type Throw = Int
type Score = Int
type Frame = Int

score :: [Throw] -> Score
score = score' 0
    where
    score' :: Frame -> [Throw] -> Score
    score' _  [] = 0
    score' 10 ts = 0
    score' n (t:u:v:ts) | t == 10     = t+u+v + score' (succ n) (u:v:ts)
    score' n (t:u:v:ts) | t + u == 10 = t+u+v + score' (succ n) (v:ts) 
    score' n (t:u:ts)                 = t+u+ score' (succ n) ts
    score' n [t]                      = t

