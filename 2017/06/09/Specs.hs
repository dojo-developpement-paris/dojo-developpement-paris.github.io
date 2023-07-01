import Test.Hspec
import Pythtree

main = hspec $ do
    describe "a structure" $ do
        it "at level 0 is a square" $ do
            tree 0 `shouldBe` [Square 1.0 0.0 (0,0)]
    
        it "at level 1 is a square plus 2 smaller squares" $ do
            tree 1  `shouldBe` tree 0 ++ [Square (1.0 / (sqrt 2.0)) 45.0 (0,1)
                                         ,Square (1.0 / (sqrt 2.0)) (45.0) (1,1)]

        it "at level 2 is 3 squares plus 4 smaller squares" $ do
            let l = 1 / (sqrt 2) / (sqrt 2)
            tree 2  `shouldBe` tree 1 ++ [Square l 90.0 (-0.5,1.5)
                                         ,Square l 90.0 (0,2)
                                         ,Square l 90.0 (1.5,2)
                                         ,Square l 90.0 (2, 1.5)]

