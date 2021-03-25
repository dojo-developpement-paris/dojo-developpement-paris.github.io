import Test.Hspec

{-
♠
♥
♦
♣
-}

card ('A':_) = 14
card ('K':_) = 13

main = hspec $ do
    describe "Comparing Cards" $ do
        it "Ace > King" $ do
            (card "A♠") `compare` (card "K♠") `shouldBe` GT
