import Test.Hspec
import Bitmap
import MinHeap

main = hspec $ do
    describe "distance" $ do
        it "computes distances on a single line, one pixel" $ do
            distance ["1"] `shouldBe` [[0]] 
            distance ["10"] `shouldBe` [[0,1]] 
            distance ["100"] `shouldBe` [[0,1,2]] 

    describe "minimal heap" $ do
        it "can be empty" $ do
            let h = emptyHeap
            isEmpty h `shouldBe` True

        it "can be added elements" $ do
            let h = emptyHeap
            isEmpty (add 42 h) `shouldBe` False

        it "can extract its minimal value" $ do
            let h = add 17 emptyHeap
                h'= add 42 h 
            extractMin h'  `shouldBe` (17, add 42 emptyHeap)
    
    describe "initial" $ do
        it "gives the initial 0-distances of a bitmap" $ do
            initial ["1"]  `shouldBe` [(0,(0,0))] 
            initial ["01"]  `shouldBe` [(0,(0,1))] 
            let bitmap = ["0001"
                         ,"0011"
                         ,"0110"]
            initial bitmap  `shouldBe` [(0,(0,3)),(0,(1,2)),(0,(1,3)),(0,(2,1)),(0,(2,2))]  
         
    describe "addAdjacents" $ do
        it "add adjacents distances to a distance" $ do
            let bitmap = ["0001"
                         ,"0011"
                         ,"0110"]
                h = initial bitmap
            addAdjacents h bitmap  `shouldBe` [(0,(1,2)),(0,(1,3)),(0,(2,1)),(0,(2,2)),(1,(0,2)),(1,(1,3))] 

            
          
    
        


    -- acceptance 
acceptance =
    describe "distances -- acceptance test" $ do
        it "converts a bitmap into a distance map" $ do
            let bitmap = ["0001"
                         ,"0011"
                         ,"0110"]
            let result =[[3,2,1,0]
                        ,[2,1,0,0]
                        ,[1,0,0,1]]
            distances bitmap `shouldBe` result
