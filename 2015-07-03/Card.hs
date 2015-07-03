module Card
where
import Data.List (sort, sortBy, reverse, group)
import Data.Ord (comparing)

type Card = (Rank,Suit)

data Suit = Hearts | Spades | Diamonds | Clubs  
    deriving (Eq,Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Ord,Eq,Show)

data Hand = HighCard [Rank] 
          | Pair Rank
    deriving (Ord, Eq, Show)

hand :: [Card] -> Hand
hand cs | isPair gs = Pair (head (head gs))
    where gs = groups cs
hand cs = HighCard $ ranks cs
    where 
    ranks = reverse.sort.map rank

groups = reverse . sortBy (comparing length). group . sort . map rank

isPair :: [[Rank]] -> Bool
isPair [[_,_],_,_,_] = True
isPair _ = False

cards :: String -> [Card]
cards = map card . words

rank :: Card -> Rank
rank (r,_) = r

card :: String -> Card
card [c,c'] = (rankFromChar c, suitFromChar c')
    where
    rankFromChar 'K' = King
    rankFromChar 'Q' = Queen
    rankFromChar 'T' = Ten
    rankFromChar 'J' = Jack
    rankFromChar 'A' = Ace
    rankFromChar '2' = Two
    rankFromChar '3' = Three
    rankFromChar '4' = Four
    rankFromChar '5' = Five
    rankFromChar '6' = Six
    rankFromChar '7' = Seven
    rankFromChar '8' = Eight
    rankFromChar '9' = Nine

    suitFromChar 's' = Spades
    suitFromChar 'c' = Clubs
    suitFromChar 'd' = Diamonds
    suitFromChar 'h' = Hearts 
    

