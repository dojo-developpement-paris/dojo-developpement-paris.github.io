import Test.Hspec
import Diamond

main = hspec $ do
    describe "line" $ do
        it "returns a line of 1 char" $ do
            line 'A' `shouldBe` "A"

        it "returns a line of several chars" $ do
            line 'D' `shouldBe` "ABCD"

    describe "diagonal" $ do
        it "given an A, yields a trivial diagonal" $ do
            diagonal 'A'  `shouldBe` ["A"]

        it "given an D, yields a A to D diagonal" $ do
            diagonal 'D'  `shouldBe` ["   A",
                                      "  B",
                                      " C",
                                      "D"]
    describe "reflection" $ do
        it "given a string, yields a reflected string" $ do
            reflection "CAT"  `shouldBe` "CATAC"

    
    describe "pads" $  do
        it "given a list of strings, pads each string to the largest" $ do
        pads ["A ","ABCD","CD"] `shouldBe` 
             ["A   "
             ,"ABCD"
             ,"CD  "]
        
    describe "pad" $ do
        it "given a max, a number and a char, yields the char added with spaces on left and right" $ do
        pad 3 0 'A' `shouldBe` "   A"
        pad 1 2 'B' `shouldBe` " B  "

    describe "diamond" $ do
        it "given a character, yields a diamond" $ do
            diamond 'B'  `shouldBe` 
                [" A "
                ,"B B"
                ," A "]
