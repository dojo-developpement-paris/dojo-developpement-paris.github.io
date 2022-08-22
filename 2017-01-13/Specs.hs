import Test.Hspec
import Guesser

main = hspec $ do
    describe "guesser" $ do
        describe "(1p, 3c)" $ do
            it "tries 1s when there's nothing" $ do
                nextGuess 1 3 [] `shouldBe` [1]
            it "tries 2s when there's no 1s" $ do
                nextGuess 1 3 [([1],(0,0))] `shouldBe` [2]
            it "tries 3s when there's no 1s nor 2s" $ do
                nextGuess 1 3 [([1],(0,0))
                              ,([2],(0,0))] `shouldBe` [3]
            it "tries 1s when there's no 2s" $ do
                nextGuess 1 3 [([2],(0,0))] `shouldBe` [1]
        describe "(1p, 4c)" $ do
            it "tries next color when all else fails" $ do
                nextGuess 1 4 [([1],(0,0))
                              ,([2],(0,0))
                              ,([3],(0,0))] `shouldBe` [4]
        describe "(2p, 3c)" $ do
            it "tries 1s when there's nothing" $ do
                nextGuess 2 3 [] `shouldBe` [1,1]
            it "tries 2s when there's no 1s" $ do
                nextGuess 2 3 [([1,1],(0,0))] `shouldBe` [2,2]
            it "keeps the first one when there's a hit" $ do
                nextGuess 2 3 [([1,1],(1,0))] `shouldBe` [1,2]
        describe "(4p, 4c)" $ do
            it "tries 1s when there's nothing" $ do
                nextGuess 4 4 [] `shouldBe` [1, 1, 1, 1]
            it "tries 2s when there's no 1" $ do
                nextGuess 4 4 [([1, 1, 1, 1], (0, 0))]
                    `shouldBe` [2, 2, 2, 2]
            it "keeps the first 1 when there's a hit" $ do
                nextGuess 4 4 [([1, 1, 1, 1], (1, 0))]
                    `shouldBe` [1, 2, 2, 2]
            it "keeps the first two 1s when there are two hits" $ do
                nextGuess 4 4 [([1, 1, 1, 1], (2, 0))]
                    `shouldBe` [1, 1, 2, 2]
            it "tries 1s when there were no 2s" $ do
                nextGuess 4 4 [([2, 2, 2, 2], (0, 0))]
                    `shouldBe` [1, 1, 1, 1]
