module LonerSpec (spec)
    where
import Test.Hspec
import Loner

spec :: SpecWith ()
spec = do
    describe "loner" $ do
        it "should evaluate trivial games" $ do
            loner "0" `shouldBe` False
            loner "1" `shouldBe` True
        it "should evaluate simple games" $ do
            loner "10" `shouldBe` True
            loner "11" `shouldBe` False

