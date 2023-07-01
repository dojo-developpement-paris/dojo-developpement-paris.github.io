import Test.Hspec
import Account

main = hspec $ do
     let accountWith b = deposit b newAccount
     describe "bank account" $ do
        it "initially has a balance of 0" $ do
            balance newAccount `shouldBe` 0

        it "deposit increases balance" $ do
            balance (deposit 1 newAccount)  `shouldBe` 1
            balance (deposit 42 newAccount)  `shouldBe` 42
            balance (deposit 1 $ accountWith 1)  `shouldBe` 2

        it "withdraw decreases balance" $ do
            fmap balance (withdraw 1 (accountWith 1)) `shouldBe` Just 0
            fmap balance (withdraw 1 (accountWith 23)) `shouldBe` Just 22
            fmap balance (withdraw 100 $ accountWith 100)  `shouldBe` Just 0

        it "withdrawing from a new account is not possible" $ do
            fmap balance (withdraw 1 newAccount)  `shouldBe` Nothing 
            
        it "withdrawing from an account with not enough money is impossible" $ do
            fmap balance (withdraw 100 $ accountWith 50)  `shouldBe` Nothing

    -- describe "history management" $ do
        

