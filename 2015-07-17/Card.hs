module Card
where


type Card = (Rank,Suit)

data Suit = Hearts | Spades | Diamonds | Clubs
    deriving (Eq,Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Eq,Ord,Show, Enum)

cards = map card . words

suit = snd
rank = fst

card :: String -> Card
card [r,s] = (charToRank r,charToSuit s)
    where
    charToSuit 'h' = Hearts
    charToSuit 's' = Spades
    charToSuit 'd' = Diamonds
    charToSuit 'c' = Clubs

    charToRank '2' = Two 
    charToRank '3' = Three 
    charToRank '4' = Four
    charToRank '5' = Five 
    charToRank '6' = Six
    charToRank '7' = Seven 
    charToRank '8' = Eight
    charToRank '9' = Nine
    charToRank 'T' = Ten
    charToRank 'J' = Jack 
    charToRank 'Q' = Queen
    charToRank 'K' = King
    charToRank 'A' = Ace

