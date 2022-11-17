import Test.Hspec
import Data.List (sort)
import Prelude hiding (Word)

type Word = String
type Dictionary = [Word]

anagramsOf :: Word -> Dictionary -> Dictionary
anagramsOf word = filter (anagramOf word) 
    where anagramOf :: Word -> Word -> Bool
          x `anagramOf` y = sort x == sort y


main = hspec $ do
    describe "anagram" $ do
        it "should find nothing in empty dictionary" $ do 
            anagramsOf "a" [] `shouldBe` []
        
        it "should find anagrams in dictionary" $ do 
            anagramsOf "bob" ["bob"] `shouldBe` ["bob"]
            anagramsOf "bob" ["alice", "bob"] `shouldBe` ["bob"]
            anagramsOf "tac" ["cat"] `shouldBe` ["cat"]
            anagramsOf "cat" ["tac"] `shouldBe` ["tac"]
            anagramsOf "cat" ["tac", "act"] `shouldBe` ["tac", "act"]

        it "should not find anagrams in dictionary" $ do 
            anagramsOf "bob" ["alice"] `shouldBe` []
            anagramsOf "bob" ["charly"] `shouldBe` []

