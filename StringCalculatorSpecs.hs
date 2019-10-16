import Test.Hspec

eval :: String -> Int
eval (c : '+' : s) = (eval [c]) + (eval s)
eval  s = read (firstNumber )
  where firstNumber = takeWhile (/='+') s 

main = hspec $ do
    describe "eval" $ do
        it "evals a literal" $ do
            eval "42"  `shouldBe` 42
            eval "51"  `shouldBe` 51
        it "evals a simple sum" $ do
            eval "0+42"  `shouldBe` 42
            eval "1+32" `shouldBe` 33
        it "eval a two number left number sum" $ do
            eval "11+0"  `shouldBe` 11
            eval "42+0" `shouldBe` 42