import Test.Hspec
import Data.Char (isUpper)

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet ["Bob"]  `shouldBe`  "Hello, Bob."
            greet ["Mark"]  `shouldBe`  "Hello, Mark."
        it "should say Hello my friend when no name given" $ do
            greet []  `shouldBe` "Hello, my friend." 
        it "should shout when given a name in uppercase" $ do
            greet ["JERRY"] `shouldBe` "HELLO JERRY!"
            greet ["MARY"] `shouldBe` "HELLO MARY!"
        

sayHello name = "Hello, " ++ name ++ "." 

shoutHello name = "HELLO " ++ name ++ "!"

greet [name] | all isUpper name  = shoutHello name
greet [name] = sayHello name
greet []     = sayHello "my friend"
