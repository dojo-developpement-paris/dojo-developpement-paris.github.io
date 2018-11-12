import Test.Hspec
import Data.Maybe (fromMaybe)

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet (Just "Bob")  `shouldBe`  "Hello, Bob."
            greet (Just "Mark")  `shouldBe`  "Hello, Mark."
        it "should say Hello my friend when no name given" $ do
            greet Nothing  `shouldBe` "Hello, my friend." 

greet name = "Hello, " ++ (fromMaybe "my friend" name) ++ "."
