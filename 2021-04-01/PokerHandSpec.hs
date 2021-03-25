import Test.Hspec

{-
♠
♥
♦
♣
-}

data Card = Card Int deriving (Eq, Ord)

card :: String -> Card
card ('A':_) = Card 14
card ('K':_) = Card 13

main = hspec $ do
    describe "Comparing Cards" $ do
        it "Ace > King" $ do
            (card "A♠") `compare` (card "K♠") `shouldBe` GT
