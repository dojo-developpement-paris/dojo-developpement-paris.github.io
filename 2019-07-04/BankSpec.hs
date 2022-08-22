import Test.Hspec
import Data.Function ((&))
import Bank (Operation(..)
            , teller
            , newAccount
            , balance
            , history)

main = hspec $ do
    describe "Deposit" $ do
        it "a deposit happend" $ do
            (newAccount 
                & teller (Deposit 10)   
                & balance)  `shouldBe` 10
            (newAccount 
                & teller (Deposit 11)   
                & balance)  `shouldBe` 11
        it "several deposits happen" $ do
            (newAccount 
                & teller (Deposit 10)   
                & teller (Deposit 10)   
                & balance)  `shouldBe` 20
        it "successive deposits and withdraws" $ do
            (newAccount 
                & teller (Deposit 10)   
                & teller (Withdraw 5)   
                & balance)  `shouldBe` 5
            (newAccount 
                & teller (Deposit 10)   
                & teller (Withdraw 5)   
                & teller (Deposit 10)   
                & balance)  `shouldBe` 15
        it "get list operation" $ do
             (newAccount 
                & history)  `shouldBe` [] 
             (newAccount 
                & teller (Deposit 10)   
                & history)  `shouldBe` 
                        [Deposit 10] 
             (newAccount 
                & teller (Deposit 10)   
                & teller (Withdraw 5)   
                & history)  `shouldBe` 
                        [Deposit 10, Withdraw 5]
        {-- it "The bank gives no money" $ do
            (newAccount 
                & teller (Withdraw 5)   
                & balance)  `shouldBe` 0
         --}   

