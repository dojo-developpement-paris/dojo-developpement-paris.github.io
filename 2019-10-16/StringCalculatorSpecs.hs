import Test.Hspec
import Data.List.Split

eval :: String -> Int
eval = sum . map read . splitOn "+"
        

main = hspec $ do
    describe "eval" $ do
        it "evals a literal" $ do
            eval "42"  `shouldBe` 42
            eval "51"  `shouldBe` 51
        it "evals a simple sum" $ do
            eval "0+42"  `shouldBe` 42
            eval "1+32" `shouldBe` 33
        it "evals a two digits left number sum" $ do
            eval "11+0"  `shouldBe` 11
            eval "42+0" `shouldBe` 42
        it "evals a three numbers sum" $ do
            eval "200+300+134" `shouldBe` 634 
