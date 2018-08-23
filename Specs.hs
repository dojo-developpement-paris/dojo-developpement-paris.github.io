import Test.Hspec
import Ladder

-- neighbor
-- breadth first search of a graph
main = hspec $ do
    describe "neighbor" $ do
        it "is false when words are totally different" $ do
            (neighbor "cat" "dog") `shouldBe` False

        it "is true when words differ only by the 1st letter" $ do
            ("cat" `neighbor` "bat") `shouldBe` True

        it "is false when words are the same" $ do
            ("cat" `neighbor` "cat") `shouldBe` False
    
        it "is true when words differ only by the 2dt letter" $ do
            ("bag" `neighbor` "big") `shouldBe` True

    describe "neighbors" $ do
        it "finds the neighbors of a word in a list of words" $ do
        let ws = words "cat dog fog cog"
        (neighbors "dog" ws) `shouldBe` [("fog","dog"),("cog","dog")] 

    describe "path" $ do
        it "walks a tree from a given word" $ do
        let t = [("cat","cot"),("cot","cog"),("cog","dog"),("dog","")]
        path "dog" t `shouldBe` ["dog"]
        path "cat" t `shouldBe` words "cat cot cog dog"

    describe "search changes a state" $ do
        let ws = words "cat cot cog dog fog"
        let initial = (["dog"],[("dog","")])

        it "stops when there is no more words to visit" $ do
            search ws initial `shouldBe` 
                ([],[("dog",""),("cog","dog"),("fog","dog"),("cot","cog"),("cat","cot")])
