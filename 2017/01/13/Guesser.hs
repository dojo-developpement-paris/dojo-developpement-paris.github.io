module Guesser where
import Data.List

type Color = Int
type Guess = [Color]
type Result = (Int,Int)

result = snd
guess = fst
wellPlaced = fst

nextGuess :: Int -> Int -> [(Guess, Result)] -> Guess
nextGuess p n gs | allFails = replicate p c
    where fails = concatMap guess gs
          allFails = 0 == sum (map wellPlaced results)
          results = map result gs
          c = head $ [1..n] \\ fails
nextGuess 2 3 gs = [c,succ c]
    where c = head hits
          hits = map (head.guess) $ filter (\(_,(h,_)) -> h == 1) gs
          

nextGuess 4 4 [([1, 1, 1, 1], (n, 0))] =
    take n [1, 1, 1, 1] ++
    drop n [2, 2, 2, 2]
