module PearlSpecs (spec)
    where
import Test.Hspec


spec :: SpecWith ()
spec = do
    describe "a dummy test" $ do 
        it "should pass" $ do
            2 + 3 `shouldBe` (4 :: Int)
