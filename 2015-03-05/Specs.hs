
module Main
where
import Test.Hspec

type Value = Maybe Char
data Trie = Trie Value [Trie] | Nil

fromList :: [String] -> Trie
fromList [] = Nil
fromList [""] = Trie Nothing []
fromList [[c]] = Trie (Just c) []
fromList [[c, d]] = Trie (Just c) [Trie (Just d) []] 

include :: Trie -> String -> Bool
include Nil _ = False
include (Trie Nothing _) "" = True 
include (Trie (Just c) [Trie (Just d) []]) [x] = False
include (Trie (Just x) _) "" = False
include (Trie (Just x) _) [c] = x == c 

main :: IO()
main = hspec $ do
    describe "an empty trie" $ do
        let emptyTrie = fromList []

        it "should recognize an empty string" $ do
            emptyTrie `include` "" `shouldBe` False
        
        it "should not include cat" $ do
            emptyTrie `include` "cat" `shouldBe` False
        
        it "should not include it" $ do
            emptyTrie `include` "it" `shouldBe` False

        it "should not include a" $ do
            emptyTrie `include` "a" `shouldBe` False

    describe "a trie with the empty word" $ do
        it "should contain the empty string" $ do
            let trie = fromList [""]
            trie `include` "" `shouldBe` True

    describe "a one letter trie" $ do
        let trie = fromList ["a"]

        it "should recognize a letter" $ do
            trie `include` "a" `shouldBe` True

        it "should not recognize other letters" $ do
            trie `include` "b" `shouldBe` False

        it "should not recognize empty string" $ do
            trie `include` "" `shouldBe` False

    describe "a two letter word trie" $ do
        let trie =  fromList ["an"]

        it "should not recognize the word a" $ do
            trie `include` "a" `shouldBe` False
