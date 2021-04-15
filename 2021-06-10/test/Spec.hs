import Test.Hspec

main = hspec $ do
  describe "canary" $
    it "quacks" $ 
      1 `shouldBe` 2
