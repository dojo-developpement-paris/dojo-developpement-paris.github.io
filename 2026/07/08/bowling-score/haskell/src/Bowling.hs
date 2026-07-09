module Bowling ( score )
    where

type Roll = Int
type Bonus = Int
data Frame = Frame Roll Roll 
           | HalfFrame Roll
           | Spare Roll Bonus
           | Strike Bonus
    deriving (Eq, Show)

extra :: Int -> [Roll] -> Int
extra n = sum . take n

frames :: Int -> [Roll] -> [Frame]
frames 10 _ = []
frames _ [] = []
frames _ [roll] = [HalfFrame roll]
frames n (roll:rolls) | roll == 10
  = Strike (2 `extra` rolls) : frames (succ n) rolls

frames n (rollA:rollB:rolls) | rollA + rollB == 10
  = Spare rollA (1 `extra` rolls) : frames (succ n) rolls

frames n (rollA:rollB:rolls)
  = Frame rollA rollB : frames (succ n) rolls

frameScore :: Frame -> Int
frameScore (HalfFrame roll) = roll
frameScore (Frame rollA rollB) = rollA + rollB
frameScore (Spare _ bonus) = 10 + bonus
frameScore (Strike bonus) = 10 + bonus

score :: [Roll] -> Int
score = sum . map frameScore . frames 0
