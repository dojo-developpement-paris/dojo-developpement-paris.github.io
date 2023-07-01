import Test.Hspec
import Data.List (sort)
import Data.Char (digitToInt)
import Data.Ord (comparing)

data Rank = Rank Int | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Show)

data Hand = HighCard [Card] | Flush 
    deriving (Eq, Ord, Show)

data Suit = Diamonds | Hearts | Clubs | Spades
    deriving (Eq, Show)

data Card = Card Rank Suit
    deriving (Eq, Show)

instance Ord Card where
    compare = comparing rank

rank :: Card -> Rank
rank (Card r _) = r

card :: String -> Card
card [r,s] = Card (charToRank r) (charToSuit s) 

charToSuit :: Char -> Suit
charToSuit 'D' = Diamonds
charToSuit 'H' = Hearts
charToSuit 'C' = Clubs
charToSuit 'S' = Spades

cards :: String -> [Card]
cards = reverse . sort . map card . words

suit :: String -> Char

suit = head . tail 
hand :: String -> Hand
hand s | all (== suit (head (words s))) (map suit (words s)) = Flush
hand s = HighCard $ cards s

charToRank :: Char -> Rank
charToRank '1' = Ace
charToRank 'T' = Ten
charToRank 'J' = Jack
charToRank 'Q' = Queen
charToRank 'K' = King
charToRank c = Rank $ digitToInt c

main = hspec $ do

    describe "hands" $ do
        

        describe "of one card" $ do
            it "expects two identical cards to be equal" $ do
                card "1D" `compare` card "1D"  `shouldBe` EQ
            it "expects two equal cards of different suit to be equal" $ do
                card "1D" `compare` card "1H"  `shouldBe` EQ
            it "expects an ace to beat a two" $ do
                card "1D" `compare` card "2D"  `shouldBe` GT
        
        describe "of five cards" $ do
            describe "high cards between one another" $ do
                it "expect hands with the same values to be equal" $ do
                    hand "2D 4D 5D 6D 7H" `compare` hand "2H 7H 5H 6H 4D"  `shouldBe` EQ
                it "expect the hand containing the highest card to win" $ do
                    hand "8D 7D 5D 6D KH" `compare` hand "1H 7H 5H 6H 4D"  `shouldBe` LT
            describe "flush" $ do
                it "expect the lowest flush to beat the higher high cards" $ do
                    hand "2D 3D 4D 5D 7D" `compare` hand "9H JD KD 1D QH" `shouldBe` GT

 
    describe "cards" $ do
        it "should be ordered according to poker rules" $ do    
            let unsorted = cards "1D QD 7D 4D 9D 6D 3D 8D 5D TD JD 2D KD"
                expected = cards "2D 3D 4D 5D 6D 7D 8D 9D TD JD QD KD 1D"
            reverse (sort unsorted) `shouldBe` expected

    
