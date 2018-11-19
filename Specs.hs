import Test.Hspec

main = hspec $ do
    describe "game of life" $ do
        it "should fail" $ do
            True `shouldBe` True
