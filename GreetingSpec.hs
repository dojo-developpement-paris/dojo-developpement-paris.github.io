import Test.Hspec
import Data.Char

greet :: [String] -> String
greet [n] | all isUpper n  = shoutHello n 
greet [n] = sayHello n 
greet []  = sayHello "my friend"
greet [a,b] = sayHello $ a ++ " and " ++ b 

sayHello :: String -> String
sayHello n = "Hello, " ++ n ++ "."

shoutHello :: String -> String
shoutHello n = "HELLO " ++ n ++ "!"

main = hspec $ do
    describe "Greet" $ do
        it "should say hello to the given name" $ do
          greet ["Bob"]  `shouldBe` "Hello, Bob."
          greet ["Alice"]  `shouldBe` "Hello, Alice."
        it "should shout hello when given an uppercase name" $ do
          greet ["JERRY"]  `shouldBe` "HELLO JERRY!"
          greet ["TOM"]  `shouldBe` "HELLO TOM!"
        it "should say hello my friend with no given name" $ do
          greet []  `shouldBe` "Hello, my friend."
        it "should say hello to each name when given several names" $ do
          greet ["Jill", "Jane"]  `shouldBe` "Hello, Jill and Jane."
        

    
