import Test.Hspec

greet :: String -> String
greet n = "Hello, " ++ n ++ "."

main = hspec $ do
    describe "Greet" $ do
        it "should say hello to the given name" $ do
          greet "Bob"  `shouldBe` "Hello, Bob."
          greet "Alice"  `shouldBe` "Hello, Alice."

        

    
