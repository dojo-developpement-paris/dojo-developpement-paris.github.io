import Test.Hspec

import Data.Char (digitToInt)
import Data.List (sort)

{-
♠ ♥ ♦ ♣
-}

data Card = Card Int
    deriving (Eq, Ord, Show)

card :: String -> Card
card ('A':_) = Card 14
card ('K':_) = Card 13
card ('Q':_) = Card 12
card ('J':_) = Card 11
card ('T':_) = Card 10
card (c:_) | c `elem` ['0'..'9'] = Card (digitToInt c)

compareHands :: [Card] -> [Card] -> Ordering
compareHands a b = (reverse $ sort a) `compare` (reverse $ sort b)

main = hspec $ do
    describe "Comparing Cards" $ do
        it "cards can be ordered by rank" $ do
            let cards = map card $ words "A♠ K♠ Q♠ J♠ T♠ 9♠ 8♠ 7♠ 6♠ 5♠ 4♠ 3♠ 2♠"
            sort cards `shouldBe` (reverse cards)
        it "two cards with the same rank are equals" $ do
            card "A♠" `compare` card "A♥" `shouldBe` EQ
            card "A♦" `compare` card "A♣" `shouldBe` EQ
            card "A♦" `compare` card "A♥" `shouldBe` EQ
    describe "Comparing hands" $ do
        it "high card with higher card wins" $ do
            let cards cs = map card $ words cs
            cards "A♠ Q♠ J♠ T♣ 9♠" `compareHands` cards "8♣ 7♠ 6♠ 3♠ 2♠" `shouldBe` GT
            cards "8♣ 7♠ 6♠ 3♠ 2♠" `compareHands` cards "A♠ Q♠ J♠ T♣ 9♠" `shouldBe` LT
