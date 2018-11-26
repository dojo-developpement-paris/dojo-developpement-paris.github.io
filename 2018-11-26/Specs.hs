import Test.Hspec

main = hspec $ do
    describe "failing test" $ do
        it "fails" $ do
            2 + 2 `shouldBe` 4
