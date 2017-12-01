import Test.Hspec

main = hspec $ do
  describe "test" $ do
   it "should" $ do
     2 + 3 `shouldBe` 4
