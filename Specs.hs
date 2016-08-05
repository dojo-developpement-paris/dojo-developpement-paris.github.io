import Test.Hspec
import Calc


main = hspec $ do
    describe "calculator" $ do
        it "should parse a integer" $ do
            parse "foo" `shouldBe` (fail' "not a number")

        it "should apply a function/operator" $ do
            fmap negate (parse "42")  `shouldBe` (parse "-42")

            fmap (^ 2) (parse "42")  `shouldBe` (parse "1764")

            (div' 5) (parse "42") `shouldBe` (parse "8")

        it "should not fail on divide by zero" $ do
            (div' 0) (parse "42")  `shouldBe` (fail' "divide by zero")

