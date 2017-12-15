import Test.Hspec
import Banking
import Control.Monad.Writer


out = \s -> writer ((),s)

main = hspec $ do
    describe "welcome new client" $ do
        it "your account amount is 0" $ do
            let inp = return "balance Smith"
            execWriter  (process inp out) `shouldBe` "0\n" 

    describe "deposit" $ do
        it "adds an amount to the balance" $ do
            let inp = return "deposit Smith 100"
            execWriter  (process inp out) `shouldBe` "balance is now 100\n" 
            
            let inp = return "deposit Smith 75"
            execWriter  (process inp out) `shouldBe` "balance is now 75\n" 

            let inp = return "deposit Smith banane"
            execWriter  (process inp out) `shouldBe` "sorry did not understand banane\n" 

    describe "deposit" $ do
        it "adds an amount to a specific client, not the other one" $ do
            let inp = return "deposit Smith 100\ndeposit Jones 75"
            execWriter  (process inp out) `shouldBe` "balance is now 100\nbalance is now 75\n" 

        it "adds an amount to a specific client, not the other one" $ do
            let inp = return "balance Smith\ndeposit Smith 83\nbalance Smith\ndeposit Smith 1"
            execWriter  (process inp out) `shouldBe` "0\nbalance is now 83\n83\nbalance is now 84\n" 
            
        
