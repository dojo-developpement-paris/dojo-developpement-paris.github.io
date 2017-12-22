import Test.Hspec


{--pascal l c | l == c = 1
pascal l 0 = 1
pascal l c = pascal (l - 1) (c - 1) + pascal (l - 1) c
--}
pascal l c = iterate pascal' [1] !! l !! c 

pascal' l = pascal'' (0:l)
    where
    pascal'' (x:x':xs) = (x + x') : pascal'' (x':xs)
    pascal'' l = l


main = hspec $ do
    describe "pascal" $ do
        it "should give a number" $ do
            pascal 0 0 `shouldBe` 1
            pascal 1 0 `shouldBe` 1
            pascal 1 1 `shouldBe` 1
            pascal 2 0 `shouldBe` 1
            pascal 2 1 `shouldBe` 2
            pascal 2 2 `shouldBe` 1
            pascal 3 0 `shouldBe` 1
            pascal 3 1 `shouldBe` 3
            pascal 3 2 `shouldBe` 3
            pascal 3 3 `shouldBe` 1
            pascal 4 0 `shouldBe` 1
            pascal 4 1 `shouldBe` 4
            pascal 4 2 `shouldBe` 6
            pascal 4 3 `shouldBe` 4
            pascal 4 4 `shouldBe` 1
            pascal 5 0 `shouldBe` 1
            pascal 5 1 `shouldBe` 5
            pascal 5 2 `shouldBe` 10
            pascal 5 3 `shouldBe` 10           
            pascal 5 4 `shouldBe` 5 
            pascal 5 5 `shouldBe` 1
    describe "pascal'" $ do
        it "should give the next line" $ do
            pascal' [1] `shouldBe` [1,1]
            pascal' [1,1] `shouldBe`[1,2,1]
            pascal' [1,2,1] `shouldBe` [1,3,3,1]
            pascal' [1,3,3,1] `shouldBe` [1,4,6,4,1]
