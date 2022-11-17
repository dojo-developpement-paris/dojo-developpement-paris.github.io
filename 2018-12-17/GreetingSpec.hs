import Test.Hspec
import Data.Char
import Data.List

type Name = String

greet :: [Name] -> String
greet [n] | all isUpper n  = shoutHello n 
greet [n] = sayHello n 
greet []  = sayHello "my friend"
greet ns = sayHello $ joinNames ns

joinNames :: [Name] -> String
joinNames [n] = n  
joinNames [a,b] = a ++ " and " ++ b   
joinNames ns = (intercalate ", " $ init ns) ++ ", and " ++ last ns   

sayHello :: Name -> String
sayHello n = "Hello, " ++ n ++ "."

shoutHello :: Name -> String
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
        it "should say hello to each name when given two names" $ do
          greet ["Jill", "Jane"]  `shouldBe` "Hello, Jill and Jane."
        it "should say hello to each name when given several names" $ do
          greet ["Amy", "Brian", "Charlotte"]  `shouldBe` "Hello, Amy, Brian, and Charlotte."
          greet ["Amy", "Brian", "Kevin", "Charlotte"]  `shouldBe` "Hello, Amy, Brian, Kevin, and Charlotte."
        

    
