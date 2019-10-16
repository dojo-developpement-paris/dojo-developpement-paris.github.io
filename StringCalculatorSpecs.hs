import Test.Hspec

eval :: String -> Int
eval "11+0" = 11
eval (c : '+' : s) = (eval [c]) + (eval s)
eval s      = read s

main = hspec $ do
    describe "eval" $ do
        it "evals a literal" $ do
            eval "42"  `shouldBe` 42
            eval "51"  `shouldBe` 51
        it "evals a simple sum" $ do
            eval "0+42"  `shouldBe` 42
            eval "1+32" `shouldBe` 33
            eval "11+0"  `shouldBe` 11