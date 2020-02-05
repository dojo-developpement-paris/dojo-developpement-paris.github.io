module PokerHand
where
import Data.List (sort)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Ord,Eq,Show)
data Suit = Hearts | Clubs | Diamonds | Spades
    deriving (Eq)

-- Suit is a type of class Ord where all values are Equal
instance Ord Suit where
    compare _ _ = EQ

type Card = (Rank,Suit)


rank :: Card -> Rank
rank (r,s) = r

data Hand = HighCard Rank Rank Rank Rank Rank 
    deriving (Ord,Eq,Show)

ranks :: [Card] -> [Rank]
ranks = reverse . sort . map rank

hand :: [Card] -> Hand
hand cards = HighCard r1 r2 r3 r4 r5 
    where [r1,r2,r3,r4,r5] = ranks cards



