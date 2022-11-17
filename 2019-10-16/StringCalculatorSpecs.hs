import Test.Hspec
import Data.List.Split

eval :: String -> Int
eval s | '-' `elem` s = ( foldl1 (-) . map read . splitOn "-") s
eval s = (sum . map read . splitOn "+") s
        

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
        it "evals a three numbers sum ignoring spaces" $ do
          eval "200 + 300 + 134" `shouldBe` 634
        it "evals a simple substraction" $ do
            eval "0-42"  `shouldBe` (-42)
            eval "42-0"  `shouldBe` 42 
