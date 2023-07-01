import Test.Hspec
import Anagrams


main = hspec $ do
    describe "key" $ do
        it "gives same value for anagrams" $ do
            key "dog" `shouldBe` key "god"
        it "gives different values for non anagrams" $ do
            key "dog" `shouldNotBe` key "cat"
        it "gives same value ignoring case" $ do
            key "dog" `shouldBe` key "God"
        it "should ignore tick" $ do
            key "dog's"  `shouldBe` key "dogs"
        it "should handle accents" $ do
            key "ô"  `shouldNotBe` key "à"
            
    describe "anagrams" $ do
        let anagrams = anagramsWith key
        it "finds anagrams given a list of words" $ do
            anagrams (words "lab niche chien bal toto ticket")  `shouldBe` [words "bal lab",words "chien niche"] 
            anagrams (words "chien bal toto ticket lab niche")  `shouldBe` [words "bal lab",words "chien niche"] 
            anagrams (words "Parliamentarian's parliamentarian's Kabbala's kabbala's")
                 `shouldBe` [words "Kabbala's kabbala's", words "Parliamentarian's parliamentarian's"]


