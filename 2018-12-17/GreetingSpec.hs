import Test.Hspec

greet :: Maybe String -> String
greet (Just n) = sayHello n 
greet Nothing  = sayHello "my friend"

sayHello :: String -> String
sayHello n = "Hello, " ++ n ++ "."

main = hspec $ do
    describe "Greet" $ do
        it "should say hello to the given name" $ do
          greet (Just "Bob")  `shouldBe` "Hello, Bob."
          greet (Just "Alice")  `shouldBe` "Hello, Alice."
        it "should say hello my friend with no given name" $ do
          greet Nothing  `shouldBe` "Hello, my friend."

        

    
