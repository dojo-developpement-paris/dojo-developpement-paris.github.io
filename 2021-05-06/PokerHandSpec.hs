import Test.Hspec

{-
♠
♥
♦
♣
-}

main = hspec $ do
    describe "a passing test" $ do
        it "should pass" $ do
            2 `shouldBe` 2
