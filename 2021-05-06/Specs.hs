import Test.Hspec

combineFor :: [Int] -> Int -> Integer
combineFor (c1:cs) s | s < c1 = combineFor cs s 
combineFor (c1:cs) s | s == c1 = 1 + combineFor cs s 
combineFor (c:cs) s | s >= c = combineFor (c:cs) (s-c) + combineFor cs s
combineFor [] _ = 0 

main = hspec $ do
    describe "money cardinality" $ do
        it "given 1c it should find 1 possible combinaisons" $ do
            [1] `combineFor` 1 `shouldBe` 1
        it "given 1c & 2c it should find 2 possible combinaisons" $ do
            [2, 1] `combineFor` 2 `shouldBe` 2
        it "given 1c & 2c it should find 1 possible combinaisons" $ do
            [2, 1] `combineFor` 1 `shouldBe` 1
        it "given the wrong coin, should not find a combination" $ do
            [5] `combineFor` 3 `shouldBe` 0
            [2] `combineFor` 1 `shouldBe` 0
        it "given a list with greater coins, find a combination with lower coins" $ do
            [5,1] `combineFor` 2 `shouldBe` 1
            [5,1] `combineFor` 5 `shouldBe` 2
            [5,1] `combineFor` 10 `shouldBe` 3
            [5,1] `combineFor` 15 `shouldBe` 4
            [5,1] `combineFor` 14 `shouldBe` 3
            [5,2,1] `combineFor` 7 `shouldBe` 6

-- 5+2   5+1+1   2+2+2+1    2+2+1+1+1 2+1+1+1+1+1 1+1+1+1+1+1+1
