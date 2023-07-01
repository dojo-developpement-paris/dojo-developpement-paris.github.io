import Test.Hspec
import Bank

main= hspec $ do
    describe "a bank account" $ do
        describe "a deposit" $ do
            it "should add amount to account" $ do
                fmap balance (account 0 >>= deposit 20) `shouldBe` Right 20
                fmap balance (account 0 >>= deposit 10) `shouldBe` Right 10
                fmap balance (account 10 >>= deposit 10) `shouldBe` Right 20
            it "should not accept a negative amount" $ do
                fmap balance (account 0 >>= deposit (-20)) `shouldBe`Left "negative deposit not allowed"
                fmap balance (account 0 >>= deposit (-10)) `shouldBe`Left "negative deposit not allowed"
        describe "a withdrawal" $ do
            it "should subtract amount from account" $ do
                fmap balance (account 10 >>= withdraw 10) `shouldBe` Right 0 
                fmap balance (account 20 >>= withdraw 10) `shouldBe` Right 10 
            it "should not accept a negative amount" $ do
                fmap balance (account 0 >>= withdraw (-20)) `shouldBe`Left "negative withdrawal not allowed"
                fmap balance (account 0 >>= withdraw (-10)) `shouldBe`Left "negative withdrawal not allowed"
        describe "balance" $ do
            it "should return the balance of an account" $ do
                fmap balance (account 10) `shouldBe` Right 10
        describe "statement" $ do
            it "should recapitulate all operations on account" $ do
                fmap statement (account 0) `shouldBe` Right []
            it "should report a deposit when a one was made" $ do
                fmap statement (account 0 >>= deposit 42) `shouldBe` Right ["deposit 42"]
                fmap statement (account 0 >>= withdraw 43) `shouldBe` Right ["withdrawal 43"]
            it "should report several operations" $ do
                fmap statement (account 0 >>= deposit 42 >>= withdraw 42) `shouldBe` 
                    Right  ["deposit 42","withdrawal 42"]
                
                
