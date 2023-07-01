import Test.Hspec
import RpnCalc

main = hspec $ do
    describe "A RPN calculator" $ do
        it "should be empty at first" $ do
            empty `shouldBe` Right []

        it "should accept a new value" $ do
            (empty >>= push 32)  `shouldBe`  Right [32]
            (empty >>= push 4) `shouldBe` Right [4]

        it "should apply unary operators" $ do
            (empty >>= push 3 >>= neg)  `shouldBe` Right [-3]
            (empty >>= push 3 >>= push 4 >>= neg) `shouldBe` Right [-4,3]
            (empty >>= push 7 >>= sign) `shouldBe` Right [1]
            (empty >>= push 4 >>= neg >>= sign) `shouldBe` Right [-1]
            (empty >>= push 0 >>= sign)  `shouldBe` Right [0]

        it "should give messages too" $ do
            (empty >>= neg) `shouldBe` Left "empty stack"
            (empty >>= sign) `shouldBe` Left "empty stack"

        it "should not operate when in error" $ do
            (empty >>= push 4 >>= neg >>= neg)  `shouldBe` Right [4]
            (empty >>= neg >>= neg)  `shouldBe` Left "empty stack"
            (empty >>= neg >>= sign)  `shouldBe` Left "empty stack"

        it "should check for empty stack" $ do
            (empty >>= check)  `shouldBe` Left "empty stack"
            (empty >>= push 1 >>= check)  `shouldBe` Right [1]
            (empty >>= push 5 >>= add) `shouldBe` Left "missing operand"
            (empty >>= push 5 >>= mult) `shouldBe` Left "missing operand"
            (empty >>= add)  `shouldBe` Left "empty stack"

        it "should allow for binary operators" $ do
            (empty >>= push 4 >>= push 3 >>= add)  `shouldBe` Right [7]
            (empty >>= push 4 >>= push 3 >>= mult)  `shouldBe` Right [12]

    
    
