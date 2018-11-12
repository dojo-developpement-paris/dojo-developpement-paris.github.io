import Test.Hspec
import Data.Char (isUpper)

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet (Just "Bob")  `shouldBe`  "Hello, Bob."
            greet (Just "Mark")  `shouldBe`  "Hello, Mark."
        it "should say Hello my friend when no name given" $ do
            greet Nothing  `shouldBe` "Hello, my friend." 
        it "should shout when given a name in uppercase" $ do
            greet (Just "JERRY") `shouldBe` "HELLO JERRY!"
            greet (Just "MARY") `shouldBe` "HELLO MARY!"

sayHello name = "Hello, " ++ name ++ "." 

shoutHello name = "HELLO " ++ name ++ "!"

greet (Just name) | all isUpper name  = shoutHello name
greet (Just name) = sayHello name
greet Nothing     = sayHello "my friend"
