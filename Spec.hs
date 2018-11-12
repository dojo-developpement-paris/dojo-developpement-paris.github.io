import Test.Hspec

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet (Just "Bob")  `shouldBe`  "Hello, Bob."
            greet (Just "Mark")  `shouldBe`  "Hello, Mark."
        it "should say Hello my friend when no name given" $ do
            greet Nothing  `shouldBe` "Hello, my friend." 

greet (Just name) = "Hello, " ++ name ++ "."
greet Nothing     = greet (Just "my friend")
