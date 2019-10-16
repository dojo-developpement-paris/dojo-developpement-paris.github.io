import Test.Hspec

main = hspec $ do
    describe "test" $ do
        it "test" $ do
            2  `shouldBe` 2
