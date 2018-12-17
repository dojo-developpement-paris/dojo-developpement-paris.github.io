import Test.Hspec
import Data.Char

greet :: Maybe String -> String
greet (Just n) | all isUpper n  = shoutHello n 
greet (Just n) = sayHello n 
greet Nothing  = sayHello "my friend"

sayHello :: String -> String
sayHello n = "Hello, " ++ n ++ "."

shoutHello :: String -> String
shoutHello n = "HELLO " ++ n ++ "!"

main = hspec $ do
    describe "Greet" $ do
        it "should say hello to the given name" $ do
          greet (Just "Bob")  `shouldBe` "Hello, Bob."
          greet (Just "Alice")  `shouldBe` "Hello, Alice."
        it "should shout hello when given an uppercase name" $ do
          greet (Just "JERRY")  `shouldBe` "HELLO JERRY!"
          greet (Just "TOM")  `shouldBe` "HELLO TOM!"
        it "should say hello my friend with no given name" $ do
          greet Nothing  `shouldBe` "Hello, my friend."

        

    
