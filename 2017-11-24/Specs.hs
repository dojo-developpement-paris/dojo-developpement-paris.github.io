
-- D: Diamonds H: Hearts S: Spades C: Clubs
-- T : Ten J : Jack Q : Queen K : King A : Ace
-- "2D 5H 8S TC JH KD AH" "2D 5H 8S TC KH KD AS"

import Test.Hspec
import Data.Ord
import Data.List

main = hspec $ do
    describe "comparison" $ do
        it "should compare HighCards" $ do
            compareHands "4D 7C 8C AC JH" "4C 7D 8D KC JS" `shouldBe` GT
            compareHands "4C 7D 8D KC JS" "4D 7C 8C AC JH" `shouldBe` LT
            compareHands "5C 6D 9D TC AS" "7C 8C QC JH KH" `shouldBe` GT
            compareHands "5C 6D 9D TC AS" "5C 6C 9C TH AH" `shouldBe` EQ
        it "should compare Pairs" $ do
            compareHands "2C 2D 5H 6D 9H" "AS KD JS TS 9H" `shouldBe` GT
            compareHands "2C 9D 5H 6D 2H" "6S KD JS TS 9H" `shouldBe` GT
            compareHands "2C AD 5H 6D 2H" "6S 3D JS TS 3H" `shouldBe` LT

    describe "card" $ do
        it "converts a 2 character string into a card" $ do
            card "2D" `shouldBe` (2,D)
            card "3D" `shouldBe` (3,D)
            card "3S" `shouldBe` (3,S)
            card "AS" `shouldBe` (14,S)
            card "JS" `shouldBe` (11,S)
            map fst (hand "TS QS KS")  `shouldBe` [10,12,13] 

        

type Card = (Rank, Suit)
type Rank = Int
type Hand = [Card]
data Suit = D | H | S | C deriving (Show, Read, Eq)

instance Ord Suit where
    compare _ _ = EQ    

compareHands h g | hasPair h && not (hasPair g) = GT
                 | hasPair g && not (hasPair h) = LT
                 | otherwise                = (comparing (reverse . sort . hand)) h g
    where
    hasPair :: String -> Bool
    hasPair h = length (groups (sort (hand h))) == 4
    
    groups :: Hand -> [Hand]
    groups = groupBy (same fst)
    
    same :: Eq b => (a -> b) -> a -> a -> Bool 
    same f a b = f a == f b
    
card :: String -> Card
card [r,s] = (readRank r,read [s])
    where
    readRank 'A' = 14
    readRank 'J' = 11
    readRank 'T' = 10
    readRank 'Q' = 12
    readRank 'K' = 13
    readRank r   = read [r] 

hand :: String -> [Card]
hand = map card . words 
