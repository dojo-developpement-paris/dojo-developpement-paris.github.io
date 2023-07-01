import Test.Hspec
import Bym

main = hspec $ do
    describe "a data-less associative container" $ do
        it "can be empty" $ do
            let container = empty :: ( Int -> Maybe String) 
            container 42  `shouldBe` Nothing 

        it "can hold a key/value" $ do
            let container = add 42 "foo" empty
            container 42 `shouldBe` Just "foo" 

    describe "a Church number" $ do
        it "can be zero" $ do
            zero succ 0 `shouldBe` 0
            zero ('*':) ""  `shouldBe` ""

        it "can be one" $ do
            one succ 0  `shouldBe` 1
            one ('*':) "" `shouldBe` "*"

        it "can be n" $ do
            n 4 succ 0  `shouldBe` 4
            n 4 ('*':) "" `shouldBe` "****"

    describe "a Church function" $ do
        let two = succ' one
            three = succ' two
        it "can be succ'" $ do
            succ' zero succ 0 `shouldBe` 1
            succ' (succ' zero) succ 0  `shouldBe` 2
            succ' (succ' one) ('*':) ""  `shouldBe` "***"

        it "can be exp" $ do
            exp' two three succ 0 `shouldBe` 9

        it "can be plus" $ do
            plus two three succ 0  `shouldBe` 5

        it "can be mult" $ do
            mult two three succ 0  `shouldBe` 6

        



