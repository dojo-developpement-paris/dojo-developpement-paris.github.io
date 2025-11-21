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

wordLadder :: String -> String -> [String] -> [String]
wordLadder "cat" "cot" dictionnary | "cot" `notElem` dictionnary = []
wordLadder "cat" "cot" ["cot", "dog", "pen"] = []
wordLadder "cat" "cot" _ = ["cat", "cot"]
wordLadder _ _ _ = []
