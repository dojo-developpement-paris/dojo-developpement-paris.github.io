import Test.Hspec
import Carpaccio

main = hspec $ do
    describe "rounded" $ do
        it "should round to the cent" $ do
            rounded 0.147 `shouldBe` 0.15

    describe "totalPrice" $ do
        it "should apply a tax rate to a price" $ do
            totalPrice 42  `shouldBe` 44.88 
            totalPrice 65  `shouldBe` 69.45

    describe "isMoney" $ do
        it "should say if an amount is a money price" $ do
            isMoney 10.05  `shouldBe` True 
            isMoney 10.045 `shouldBe` False

    describe "printTotal" $ do
        it "should print total price of a given input" $ do
            printTotal "42" `shouldBe` "44.88"

        it "should display a message when not a number" $ do
            printTotal "foo"  `shouldBe` "not a number"

        it "should display a different message when missing number" $ do
            printTotal ""  `shouldBe` "missing number" 

        it "should display an error when not a money amount" $ do
            printTotal "10.347"  `shouldBe` "not a price"

    describe "arg" $ do
        it "yield the first arg given or an error" $ do
            arg "42"  `shouldBe`  Right "42"
            arg "  "    `shouldBe` Left "missing number"

    describe "process" $ do
        it "shoud apply a function to lines of input" $ do
            process (++"!") "foo\nbar\n" `shouldBe` "foo!\nbar!\n" 
