{-# LANGUAGE FlexibleInstances #-}

import Test.Hspec
import Test.QuickCheck

main = hspec $ do
    describe "a bank" $ do
        describe "holds accounts" $ do
            describe "an account..." $ do
                it "starts with no money on it" $ do
                    balance newAccount `shouldBe` 0
                it "can receive money, increasing balance" $ do
                    newAccount 
                        |> deposit 1000
                        |> balance
                        `shouldBe` 1000
                it "can receive money, increasing balance" $ do
                    newAccount 
                        |> deposit 1000
                        |> withdraw 500
                        |> balance
                        `shouldBe` 500
                it "cannot withdraw on new account" $ do
                    newAccount
                        |> withdraw 300
                        |> balance 
                         `shouldBe` 0
                it "cannot have negative balance" $ do
                    newAccount
                        |> deposit 1
                        |> withdraw 10000
                        |> balance
                         `shouldBe` 1
                it "can be reported on" $ do
                    newAccount 
                        |> report 
                        `shouldBe` []
                    newAccount 
                        |> deposit 1000
                        |> report 
                        `shouldBe` [Deposit 1000]
                    newAccount 
                        |> deposit 1000
                        |> withdraw 500
                        |> report 
                        `shouldBe` [Deposit 1000, Withdrawal 500]
                it "report on refused  withdrawal" $ do
                    newAccount
                        |> deposit 1
                        |> withdraw 10000
                        |> report
                         `shouldBe` [Deposit 1, Withdrawal 10000, Refused (Withdrawal 10000)]
                it "cannot have negative balance" $ property $
                    forAll aleaOperations $ \operations -> balance (foldl (\acc op -> op acc) newAccount operations) >= 0 

type Operation = Account -> Account

instance Show (Account -> Account) where show = error "Some function"

aleaOperations :: Gen [Operation] 
aleaOperations = listOf aleaOperation

                
aleaOperation :: Gen Operation
aleaOperation = oneof [fmap deposit (choose (1, 10000)),fmap withdraw (choose (1, 10000))]

                    
type Account = [Movement]
type Amount  = Double

data Movement = Deposit Amount
              | Withdrawal Amount
              | Refused Movement
    deriving (Show, Eq)

balance :: Account -> Amount
balance []                            = 0
balance ((Deposit amount):history)    = balance history + amount 
balance ((Withdrawal amount):history) = balance history - amount 
balance (Refused (Withdrawal amount):history) = balance history + amount 

newAccount :: Account
newAccount = [] 

deposit :: Amount -> Account -> Account
deposit money account = account ++ [Deposit money]

withdraw :: Amount -> Account -> Account
withdraw money account | balance account < money = account ++ [Withdrawal money, Refused (Withdrawal money)]
                       | otherwise               = account ++ [Withdrawal  money] 

report :: Account -> [Movement]
report  = id 

(|>) :: a -> (a -> b) -> b
a |> function = function a
