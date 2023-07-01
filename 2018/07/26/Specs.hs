import Test.Hspec
import Sandpile

main = hspec $ do
    describe "given a filled cell" $ do
        it "when filled with another sand grain, it is filled with 2" $ do
            let m = [[1]]
            fill 4807 m (0,0) `shouldBe` [[2]] 


    describe "given a 2x1 matrix" $ do
        it "when it collapse, sand get to the edges" $ do
            let m = [[9,0]]
            fill 9 m (0,0) `shouldBe` [[9,1]]
        it "when it collapse at a different max, sand get to the edges" $ do
            let m = [[10,0]]
            fill 10 m (0,0) `shouldBe` [[10,1]]

            let m = [[10,1]]
            fill 10 m (0,0) `shouldBe` [[10,2]]

            let m = [[0,0]]
            fill 10 m (0,1) `shouldBe` [[0,1]]

            let m = [[2,1]]
            fill 10 m (0,1) `shouldBe` [[2,2]]

    describe "given a 3x1 matrix" $ do
        it "when filled at a coord, sand gets at this coord" $ do
            let m = [[2,1,0]]
            fill 10 m (0,2) `shouldBe` [[2,1,1]]

            fill 10 m (0,1) `shouldBe` [[2,2,0]]

        it "when filled at max, sand gets on the sides" $ do    
            let m = [[0,2,0]]
            fill 2 m (0,1) `shouldBe` [[1,1,1]]

    describe "given a 3x3 matrix" $ do
        it "when filled at first row, puts sand on the first row" $ do  
            let m = [[0,0,0]
                    ,[0,0,0]
                    ,[0,0,0]]
            fill 2 m (0,1) `shouldBe` [[0,1,0]
                                      ,[0,0,0]
                                      ,[0,0,0]]


--        it "when filled at last row, puts sand on the last row" $ do  

--             let m = [[0,0,0]
--                     ,[0,0,0]
--                     ,[0,0,0]]
--             fill 2 m (2,1) `shouldBe` [[0,0,0]
--                                       ,[0,0,0]
--                                       ,[0,1,0]]
-- 
