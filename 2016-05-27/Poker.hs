module Poker
where
import Data.Ord (comparing)
import Data.List (sort,nub)

rsort = reverse . sort

data Category = HighCard 
              | Flush
    deriving (Eq,Show,Ord)

data Hand = Hand Card Card Card Card Card
   deriving (Eq,Show) 

instance Ord Hand
    where
    compare h g = case comparing category h g of
                    EQ -> comparing (rsort.map rank.cards) h g 
                    r  -> r

type Rank = Int
type Card = (Rank,Suit)

data Suit = Hearts | Spades | Diamonds | Clubs
    deriving (Show, Eq)

suit :: Card -> Suit
suit (r,s) = s

rank :: Card -> Rank
rank (r,s) = r

cards :: Hand -> [Card]
cards (Hand a b c d e) = [a, b, c, d, e]

category :: Hand -> Category
category h | length (nub (map suit (cards h))) == 1 = Flush
           | otherwise                              = HighCard
