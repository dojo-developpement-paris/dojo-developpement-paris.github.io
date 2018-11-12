import Test.Hspec

main = hspec $ do
    describe "dummy" $ do
        it "should pass" $ do
            2 + 2  `shouldBe`  4
