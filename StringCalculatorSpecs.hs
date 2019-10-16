import Test.Hspec

compute :: String -> Int
compute = read

main = hspec $ do
    describe "StringCalculator" $ do
        it "computes a literal" $ do
            compute "42"  `shouldBe` 42
            compute "51"  `shouldBe` 51
