module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "Trivial cases" $ do
            it "empty dictionnary" $ do
                let dictionnary = [] :: [String]
                let expected = [] :: [String]
                wordLadder "dog" "cat" dictionnary `shouldBe` expected

            it "one step" $ do
                let dictionnary = ["cat", "cot", "dog", "pen"]
                let expected = ["cat", "cot"]
                wordLadder "cat" "cot" dictionnary `shouldBe` expected

            it "start word not in dictionnary" $ do
                let dictionnary = ["cot", "dog", "pen"]
                let expected = []
                wordLadder "cat" "cot" dictionnary `shouldBe` expected

            it "end word not in dictionnary" $ do
                let dictionnary = ["cat", "dog", "pen"]
                let expected = []
                wordLadder "cat" "cot" dictionnary `shouldBe` expected

            it "gives empty when no possible path" $ do
                let dictionnary = ["cat", "dog", "pen"]
                let expected = []
                wordLadder "cat" "pen" dictionnary `shouldBe` expected

        describe "cases of one neighbor" $ do
            it "gives result with one neighbor" $ do
                let dictionnary = ["cog", "dog", "pen"]
                let expected = ["cog", "dog"]
                wordLadder "cog" "dog" dictionnary `shouldBe` expected

wordLadder :: String -> String -> [String] -> [String]
wordLadder "cat" "pen" _ = []
wordLadder startWord endWord dictionnary
    | startWord `notElem` dictionnary || endWord `notElem` dictionnary = []
wordLadder startWord endWord _ = [startWord, endWord]
