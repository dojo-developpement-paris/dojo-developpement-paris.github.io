import Test.Hspec
import RpnCalc

main = hspec $ do
    describe "an RPN calculator" $ do
        it "should be empty at the beginning" $ do
            empty  `shouldBe` Right []

        it "should accept a number" $ do
            (empty >>= push 42)  `shouldBe` Right [42]

        it "should allow for unary operation" $ do
            (empty >>= push 42 >>= neg)  `shouldBe` Right [-42]
            (empty >>= push 42 >>= incr)  `shouldBe` Right [43] 
            (empty >>= push 42 >>= unary (1-)) `shouldBe` Right [-41] 

        it "should allow for binary operation" $ do
            (empty >>= push 42 >>= push 17 >>= add)  `shouldBe` Right [59]

        it "should give a message in case of error" $ do
            (empty >>= neg) `shouldBe` Left "Missing Operand"
            (empty >>= incr) `shouldBe` Left "Missing Operand"
            (empty >>= push 42 >>= add) `shouldBe` Left "Missing Operand"
            (empty >>= add) `shouldBe` Left "Missing Operand"

        it "should stop calculating in case of previous error" $ do
            (empty >>= incr >>= push 42) `shouldBe` Left "Missing Operand"
            (empty >>= neg >>= neg)  `shouldBe` Left "Missing Operand"
            (empty >>= incr >>= incr) `shouldBe` Left "Missing Operand"
            

