import Test.Hspec

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet "Bob"  `shouldBe`  "Hello, Bob."
            greet "Mark"  `shouldBe`  "Hello, Mark."

greet name = "Hello, " ++ name ++ "."
