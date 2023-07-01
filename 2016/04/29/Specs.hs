import Test.Hspec
import Data.List (sort)

isAnagram :: String -> String -> Bool
isAnagram w w' = (sort w) == (sort w')
isAnagram' w w' = w == (sort w')
isAnagram'' w w' = length w == length w' && w == (sort w')

anagramsOf :: [String] -> String -> [String]
anagramsOf dict searched = filter (isAnagram'' (sort searched)) dict 

main = hspec $ do
  describe "Anagrams" $ do
    describe "without any words in the dictionnary" $ do
      it "doesn't find any anagrams of any word" $ do
        ([] `anagramsOf` "toto") `shouldBe` []

    describe "There is one word in the dictionnary" $ do
      it "finds the word of a dictionary containing one word" $ do
        (["toto"] `anagramsOf` "toto") `shouldBe` ["toto"]
      it "does not finds any word if no anagrams" $ do
        (["toto"] `anagramsOf` "titi") `shouldBe` []
      it "finds the correct anagram" $ do
        (["otot"] `anagramsOf` "toto") `shouldBe` ["otot"]
    describe "with two words in the dictionnary" $ do
      it "does not find any anagram" $ do
        (["tutu", "titi"] `anagramsOf` "toto") `shouldBe` []
      it "does find one anagram" $ do
        (["toto", "titi"] `anagramsOf` "toto") `shouldBe` ["toto"]

    describe "1 000 000 words in the dictionnary" $ do
      it "takes a fucking long time" $ do
        let bigDictionary = (take 1000000 (repeat "anticonstitutionnellement"))
        (bigDictionary `anagramsOf` "anticonstitutionnel") `shouldBe` []
        (bigDictionary `anagramsOf` "anticonstitutionnellement") `shouldBe` bigDictionary

  describe "isAnagram" $ do
    it "return true when words are same" $ do
      ("toto" `isAnagram` "toto") `shouldBe` True
    it "return true when letters are inversed" $ do
      ("otot" `isAnagram` "toto") `shouldBe` True
    it "return true when letters are the same" $ do
      ("oott" `isAnagram` "toto") `shouldBe` True
    it "return false when letters are different" $ do
      ("oott" `isAnagram` "titi") `shouldBe` False
