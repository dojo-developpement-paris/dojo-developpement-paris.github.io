import Test.Hspec
import Grid2048

main = hspec $ do
    describe "compress" $ do
        it "should do nothing on a column with no pairs" $ do
            compress [2,4,8,2] `shouldBe` [2,4,8,2]
            compress [2,4]     `shouldBe` [2,4]

        it "should compress a column beginning with one pair" $ do
            compress [2,2] `shouldBe` [4]
            compress [8,8] `shouldBe` [16]

        it "should compress a column containing one pair" $ do
            compress [2,4,4] `shouldBe` [2,8]

        it "should not compress too much a column containing 3 same tiles" $ do
            compress [2,2,2] `shouldBe` [4,2]

        it "should compress a quartet into two sums" $ do
            compress [4,4,4,4] `shouldBe` [8,8]

        it "should eliminate empty cells" $ do
            compress [2,0,4] `shouldBe` [2,4]
           
    describe "pad" $ do
        it "pads a column with 0 up to 4 cells" $ do
            pad [2,4] `shouldBe` [2,4,0,0]


    describe "moveColumn" $ do
        it "moves the tiles of a column and compress them" $ do
            moveColumn [2,0,2,4] `shouldBe` [4,4,0,0]

    describe "moveLeft" $ do
        it "moves and compress tiles to the left" $ do
            move Left_ [2,0,2,4] `shouldBe` [4,4,0,0]

    describe "moveRight" $ do
        it "moves and compress tiles to the right" $ do
            move Right_ [2,0,2,4] `shouldBe` [0,0,4,4]

    describe "moveGridRight" $ do
        it "moves a whole grid to the right" $ do
            let g =[[2,0,2,4]
                   ,[0,0,4,0]
                   ,[2,4,4,2]
                   ,[4,2,2,4]]
                g'=[[0,0,4,4]
                   ,[0,0,0,4]
                   ,[0,2,8,2]
                   ,[0,4,4,4]]
            moveGrid Right_ g `shouldBe` g'

    describe "moveGridLeft" $ do
        it "moves a whole grid to the left" $ do
            let g =[[2,0,2,4]
                   ,[0,0,4,0]
                   ,[2,4,4,2]
                   ,[4,2,2,4]]
                g'=[[4,4,0,0]
                   ,[4,0,0,0]
                   ,[2,8,2,0]
                   ,[4,4,4,0]]
            moveGrid Left_ g `shouldBe` g'
            
    describe "moveGridDown" $ do
        it "moves a whole grid to the left" $ do
            let g =[[2,0,2,4]
                   ,[0,0,4,0]
                   ,[2,4,4,2]
                   ,[4,2,2,4]]
                g'=[[0,0,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
            moveGrid Down_ g `shouldBe` g'
    
    describe "moveGridUp" $ do
        it "moves a whole grid up" $ do
            let g =[[2,0,2,4]
                   ,[0,0,4,0]
                   ,[2,4,4,2]
                   ,[4,2,2,4]]

                g'=[[4,4,2,4]
                   ,[4,2,8,2]
                   ,[0,0,2,4]
                   ,[0,0,0,0]]
            moveGrid Up_ g `shouldBe` g'

    describe "insert" $ do
        it "insert a tile into a grid" $ do
            let g =[[0,0,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
                g'=[[0,2,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
            insertTile 2 0 1 g `shouldBe` g'

        it "insert only in a cell that is empty" $ do
            let g =[[0,0,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
            insertTile 8 1 2 g `shouldBe` g
    describe "tryToInsertion" $ do
        it "tries positions to insert until insert is done" $ do
            let g =[[0,0,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
                g'=[[8,0,0,0]
                   ,[0,0,2,4]
                   ,[4,4,8,2]
                   ,[4,2,2,4]]
            tryInsertion 8 [(1,2),(3,3),(2,1),(0,0),(0,3)] g `shouldBe` g'
            
