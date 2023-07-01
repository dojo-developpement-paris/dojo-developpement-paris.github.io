import Test.Hspec
import RPN

main = hspec $ do
    describe "RPN calc" $ do
        it "yields a given number" $ do
            calc "4807" `shouldBe` Right 4807

            calc "32768" `shouldBe` Right 32768

        it "yields a message in case of error" $ do
            calc "§" `shouldBe` Left "§ ??" 

            calc "é" `shouldBe` Left "é ??"

        it "allows for unary negation" $ do
            calc "32~"  `shouldBe` Right (-32)

            calc "56~"  `shouldBe` Right (-56)

            calc "8~~" `shouldBe` Right 8

        it "stops calculating after error" $ do
            calc "A~~"  `shouldBe` Left "A ??"

        it "allows for unary factorial" $ do
            calc "4!"  `shouldBe` Right 24

        it "skips spaces" $ do
            calc "43 ~  ~"  `shouldBe` Right 43
        
        it "allows for binary addition" $ do
            calc "4 2+"  `shouldBe` Right 6

        it "allows for binary multiplication" $ do
            calc "4 2*"  `shouldBe` Right 8

        it "allows for binary subtraction" $ do
            calc "4 2-"  `shouldBe` Right 2

        it "checks for parameters" $ do
            calc "~"  `shouldBe` Left "not enough parameters"
    
            calc "34+" `shouldBe` Left "not enough parameters" 

            calc "+" `shouldBe` Left "not enough parameters"
