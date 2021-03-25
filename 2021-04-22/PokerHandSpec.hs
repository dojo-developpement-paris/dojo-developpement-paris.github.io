import Test.Hspec
import Data.Char (digitToInt)
import Data.List (sort)

{-
♠
♥
♦
♣
-}

data Card = Card Int
    deriving (Eq, Ord, Show)

card :: String -> Card
card ('A':_) = Card 14
card ('K':_) = Card 13
card ('Q':_) = Card 12
card ('J':_) = Card 11
card ('T':_) = Card 10
card (c:_) = Card (digitToInt c)

main = hspec $ do
    describe "Comparing Cards" $ do
        it "Ace > King" $ do
            (card "A♠") `compare` (card "K♠") `shouldBe` GT
        it "cards can be ordered by rank" $ do
            let cards = map card $ words "A♠ K♠ Q♠ J♠ T♠ 9♠ 8♠ 7♠ 6♠ 5♠ 4♠ 3♠ 2♠"
            sort cards `shouldBe` (reverse cards)
