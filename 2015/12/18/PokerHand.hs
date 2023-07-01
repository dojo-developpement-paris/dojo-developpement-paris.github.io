module PokerHand
where
import Data.List

type Hand = [Int]

compareHand :: Hand -> Hand -> Ordering
compareHand h h' = compare (rsort h) (rsort h')
    where rsort = reverse . sort
