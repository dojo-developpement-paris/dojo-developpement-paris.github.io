import Test.Hspec
import Ladder

main = hspec $ do
   describe "ladder" $ do
    describe "adjacent" $ do
        it "is false if words are identical" $ do
           "CAT" `adjacent` "CAT"  `shouldBe` False

        it "is true if words differ by their first letter" $ do
           "BAT" `adjacent` "CAT"  `shouldBe` True
           "CAT" `adjacent` "BAT"  `shouldBe` True

        it "is true if words differ by any one letter" $ do
           "BAG" `adjacent` "BUG"  `shouldBe` True
           "BAG" `adjacent` "BIG"  `shouldBe` True

        it "is false if words differ by more than one letter" $ do
            "DOG" `adjacent` "CAT" `shouldBe` False

    describe "dictionary" $ do
        describe "given a list of words" $ do
            it "should be empty if the list is empty" $ do
                dictionary []  `shouldBe` []

            it "should not have adjacent words if there's only one word" $ do
                dictionary ["DOG"] `shouldBe` [("DOG",[])] 
                dictionary ["CAT"] `shouldBe` [("CAT",[])] 

            it "should have adjacent words if there are adjacent words" $ do
                dictionary ["CAT","DOG","FOG"] `shouldBe`
                 [("CAT",[]),("DOG",["FOG"]),("FOG",["DOG"])]                    

    describe "adjacents"  $ do
        describe "given a dictionary" $ do
            let d = dictionary (words "CAT COT COG DOG FOG QUX")
    
            it "and a word returns an empty list if there's no adjacent words for that word" $ do
                adjacents d "QUX" `shouldBe` []
        
            it "given a word, returns a list of adjacent words to that word" $ do
                adjacents d "DOG"  `shouldBe` ["COG","FOG"]

                
            
