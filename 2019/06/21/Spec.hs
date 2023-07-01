import Test.Hspec
import Hangman

main = hspec $ do
    describe "hideWord" $ do
        it "replace letters by dashes" $ do
            hideWord "A" [] `shouldBe` "_" 
            hideWord "TOTO" [] `shouldBe` "____" 
            hideWord "TOTO" ['T'] `shouldBe` "T_T_"
            hideWord "TOTO" ['O'] `shouldBe` "_O_O"
            hideWord "TOTO" ['B'] `shouldBe` "____"

    describe "gameStatus" $ do
        it "says when won " $ do
            gameStatus "A" ['A'] `shouldBe` Won
        it "says when should continue" $ do
            gameStatus "A" [] `shouldBe` Continue 
        it "says when should continue 2" $ do
            gameStatus "TOTO" ['T'] `shouldBe` Continue
