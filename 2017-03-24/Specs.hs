import Test.Hspec
import Bowling

main = hspec $ do
    describe "un score de bowling" $ do
        it "égale la somme de la liste des points" $ do
            score [1,2,3] `shouldBe` 6
            score [2,3,4] `shouldBe` 9

        it "compte les spares" $ do
            score [4,6,7] `shouldBe` 24
            score [4,6,8] `shouldBe` 26
            score [5,5,9] `shouldBe` 28

            score [5,5,5,5,5] `shouldBe` 35
            score [5,5,5,5,5,5,5] `shouldBe` 50

            score [0,5,5,5] `shouldBe` 15
            score [0,0,5,5,5] `shouldBe` 20
    
            score [0, 10, 5] `shouldBe` 20

        it "compte les strikes" $ do
            score [10,2] `shouldBe` 14
            score [10,3] `shouldBe` 16
            score [10,3,2] `shouldBe` 20
            score [10,10,3,2] `shouldBe` 43

        it "compte les strikes et les spares mélangés" $ do
            score [10,6,4,2] `shouldBe` 34

        it "compte bien les tirs en fin de partie" $ do
            let firstframes = replicate 18 0
                spare       = [5,5]
                bonus       = [7]
            score (firstframes ++ spare ++ bonus) `shouldBe` 17
            let firstframes = replicate 18 0
                strike      = [10]
                bonus       = [5] 
            score (firstframes ++ strike ++ bonus) `shouldBe` 15
            
        it "compte un perfect" $ do
            score (replicate 12 10)  `shouldBe` 300
        

            
