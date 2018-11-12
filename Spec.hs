import Test.Hspec
import Data.Char (isUpper)
import Data.List (intercalate)

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
        it "should say hello to two people" $ do
            greet ["Jill","Jane"] `shouldBe` "Hello, Jill and Jane."
        it "should say hello to more than two people" $ do
            greet ["Amy","Brian","Charlotte"]  `shouldBe` "Hello, Amy, Brian, and Charlotte." 
            greet ["Dave","Eric","Fred"]  `shouldBe` "Hello, Dave, Eric, and Fred."
        

sayHello name = "Hello, " ++ name ++ "." 

shoutHello name = "HELLO " ++ name ++ "!"

greet [n,m,o] = greet [n',o]
    where n' = intercalate ", " [n,m] ++ ","
greet [n,m]  = sayHello (n ++ " and " ++ m) 
greet [name] | all isUpper name  = shoutHello name
greet [name] = sayHello name
greet []     = sayHello "my friend"
