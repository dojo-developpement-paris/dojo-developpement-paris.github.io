import Test.Hspec
import Calc

main = hspec $ do
    describe "a RPN calculator" $ do
        it "outputs a result" $ do
            calc "0" `shouldBe` Right 0

            calc "4807" `shouldBe` Right 4807

        it "allows for unary negation" $ do
            calc "42 NEG" `shouldBe` Right (-42)

            calc "35 NEG" `shouldBe` Right (-35)

        it "allows for addition" $ do
            calc "4 7 ADD" `shouldBe` Right 11    

            calc "5 2 ADD" `shouldBe` Right 7    

        it "allows for expressions" $ do
            calc "3 2 ADD NEG" `shouldBe` Right (-5)

        it "outputs a message in case of error" $ do
            calc "NEG" `shouldBe` Left "empty stack"   
            calc "23 ADD" `shouldBe` Left "empty stack"

            calc "NEG 3 2 ADD" `shouldBe`Left "empty stack" 

        it "allows for stack manipulation" $ do
            calc "5 DUP ADD" `shouldBe` Right 10
            

        

         
