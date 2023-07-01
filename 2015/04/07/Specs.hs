import Test.Hspec
import RPNCalculator

main = hspec $ do
    describe "A RPN calculator" $ do
        it "should allow pushing a number" $ do
            push 4807 []  `shouldBe` (Right [4807])

        it "should allow error message" $ do
            err "foo" [] `shouldBe` (Left "foo - no result")

        it "should allow several pushes" $ do
            (calc >>= push 2 >>= push 3)  `shouldBe`
                (Right [3,2])

        it "should propagate error" $ do
            (calc   >>= 
             push 2 >>=
             err "bar" >>= 
             push 4) `shouldBe`
                (Left "bar - no result")

        it "should allow for unary operations" $ do
            (calc >>= push 3 >>= unary negate)  `shouldBe` (Right [-3])
            (calc >>= push 7 >>= unary (+1))  `shouldBe` (Right [8])

        it "should allow for binary operations" $ do
            (calc >>= push 2 >>= push 5 >>= binary (*))  `shouldBe` (Right [10])
            (calc >>= push 2 >>= push 5 >>= binary (-))  `shouldBe` (Right [-3])
            (calc >>= push 5 >>= push 2 >>= binary (-))  `shouldBe` (Right [3])

        it "should inspect stack size" $ do
            (calc >>= inspect 1)  `shouldBe` (Left "not enough parameters - no result")
            (calc >>= push 1 >>= inspect 1)  `shouldBe` (Right [1])
            (calc >>= push 9 >>= inspect 2)  `shouldBe` (Left "not enough parameters - no result")
            (calc >>= push 1 >>= push 3 >>= inspect 2)  `shouldBe` (Right [3,1])

        it "should allow only safe operations" $ do
            (calc >>= unary (+1))  `shouldBe` (Left "not enough parameters - no result")
            (calc >>= push 4 >>= binary (+))  `shouldBe` (Left "not enough parameters - no result")

        it "should allow for a command" $ do
            (calc >>= push 3 >>= cmd "neg") `shouldBe` (Right [-3])
            (calc >>= push 3 >>= cmd "inc") `shouldBe` (Right [4])
            (calc >>= push 3 >>= push 4 >>= cmd "add") `shouldBe` (Right [7])
            (calc >>= push 3 >>= push 4 >>= cmd "sub") `shouldBe` (Right [-1])
            (calc >>= push 3 >>= push 4 >>= cmd "mul") `shouldBe` (Right [12])
            (calc >>= push 13 >>= push 4 >>= cmd "div") `shouldBe` (Right [3])
            (calc >>= push 13 >>= push 4 >>= cmd "mod") `shouldBe` (Right [1])

        it "should interpret unknown command as a number" $ do
            (calc >>= cmd "4807")  `shouldBe` (Right [4807])

        it "should emit a message about unknown commands that are not numbers" $ do
            (calc >>= cmd "ned") `shouldBe` (Left "ned ? - no result")

        it "should evaluate sequences of commands" $ do
            (calc >>= eval "3 4 mul inc") `shouldBe` (Right [13])

        it "should process lists of string" $ do
            process calc ["3 4","mul 2","inc add"]  `shouldBe` 
                ["[4,3]","[2,12]","[15]"]

        it "should restart after one error line" $ do
            process calc ["3 4","albert","3 4 add"]  `shouldBe` 
                ["[4,3]","albert ? - no result","[7]"]
        
            
