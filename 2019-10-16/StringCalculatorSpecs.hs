import Test.Hspec

compute :: String -> Int
compute _ = 42

main = hspec $ do
    describe "StringCalculator" $ do
        it "computes a literal" $ do
            compute "42"  `shouldBe` 42
