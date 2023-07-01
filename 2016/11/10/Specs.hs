
import Test.Hspec
import Connect4

main = hspec $ do
    describe "grid" $ do
        it "should create a grid from strings" $ do
            let g = grid ["."]
            g!!0!!0  `shouldBe` Nothing
            let g = grid ["o"]
            g!!0!!0  `shouldBe` Just Yellow
            let g = grid ["*"]
            g!!0!!0  `shouldBe` Just Red
            let g = grid ["o",
                          "*"]
            g!!1!!0 `shouldBe` Just Yellow
            g!!0!!0 `shouldBe` Just Red
            let g = grid ["*o"]
            g!!0!!0 `shouldBe` Just Red
            g!!0!!1 `shouldBe` Just Yellow

    describe "checker" $ do
        it "should check for a vertical or horizontal connect4" $ do
            let g = grid ["......."]
            check Yellow g `shouldBe` False
            let g = grid ["oooo..."]
            check Yellow g `shouldBe` True
            let g = grid ["****..."]
            check Yellow g `shouldBe` False
            check Red g `shouldBe` True
            let g = grid ["......."
                         ,"****..."
                         ,"o*o*..."]
            check Red g `shouldBe` True
            let g = grid ["..o...."
                         ,"..o...."
                         ,"..o...."
                         ,"..o...."]
            check Yellow g  `shouldBe` True
    
        it "should check for a diagonal down connect4" $ do
            let g = grid ["o......" 
                         ,"*o....." 
                         ,"o*o...." 
                         ,"o**o..."]
            check Yellow g `shouldBe` True 
            let g = grid ["...o..." 
                         ,"...*o.." 
                         ,"...o*o." 
                         ,"...o**o"
                         ,"...*o*o"
                         ,"...*o*o"
                         ]
            check Yellow g `shouldBe` True 
            let g = grid ["..o...." 
                         ,"..*o..." 
                         ,"..o*o.." 
                         ,"..o**o."]
            check Yellow g `shouldBe` True 
        it "should check for a diagonal up connect4" $ do
            let g = grid ["...o..." 
                         ,"..o*..." 
                         ,".oo*..." 
                         ,"o**o..."]
            check Yellow g `shouldBe` True 
        it "should check for a diagonal up connect4" $ do
            let g = grid ["......o" 
                         ,".....o*" 
                         ,"....oo*" 
                         ,"...o**o"]
            check Yellow g `shouldBe` True 
    describe "moves" $ do
        it "should detect all possible moves given a grid" $ do
            let g = grid ["......."]
            moves g  `shouldBe` [0,1,2,3,4,5,6]
            let g = grid ["...*o.." ,"...*o.." ,"...o*o." ,"...o**o" ,"...*o*o" ,"...*o*o" ]
            moves g `shouldBe` [0,1,2,5,6]
    describe "init" $ do
        it "should give us an empty grid" $ do
            let g = initial 
            g `shouldBe` (replicate 6 (replicate 7 Nothing))

    describe "play" $ do
        it "should stack a token in the grid" $ do
            let g = initial
                g' = play g 0 Yellow
            g'!!0!!0 `shouldBe` Just Yellow
            let g = initial
                g' = play g 0 Red
            g'!!0!!0 `shouldBe` Just Red
            let g = initial
                g' = play g 1 Red
            g'!!0!!1 `shouldBe` Just Red
            let g = initial
                g'  = play g  0 Red
                g'' = play g' 0 Yellow
            g'!!0!!0 `shouldBe` Just Red
            g''!!1!!0 `shouldBe` Just Yellow
            let g = initial
                g'  = play g  0 Red
                g'' = play g' 1 Yellow
            g'!!0!!0 `shouldBe` Just Red
            g''!!0!!1 `shouldBe` Just Yellow
    describe "text" $ do
        it "should represent a grid" $ do
            let g = initial
            text g  `shouldBe` ".......\n.......\n.......\n.......\n.......\n.......\n"
            let g = play initial 0 Yellow
            text g  `shouldBe` ".......\n.......\n.......\n.......\n.......\no......\n"
    describe "eval" $ do
        it "should evaluate moves given a grid" $ do
            let g = grid ["......."
                         ,"......."
                         ,"......."
                         ,"o......"
                         ,"o......"
                         ,"o......"]
                e = eval g Yellow 
            e!!0 `shouldBe` (0,victory)
            length e  `shouldBe` 7
        it "should evaluate moves in col 1  given a grid" $ do
            let g = grid ["......."
                         ,"......."
                         ,"......."
                         ,".o....."
                         ,".o....."
                         ,".o....."]
                e = eval g Yellow 
            e!!1 `shouldBe` (1,victory)
    
        it "should evaluate moves in col 5  given a grid" $ do
            let g = grid ["..o...."
                         ,"..o...."
                         ,"..o...."
                         ,"..*..o."
                         ,"..*..o."
                         ,"..o..o."]
                e = eval g Yellow 
            (snd (e!!2)) < victory `shouldBe` True
            (5,victory) `elem` e `shouldBe` True

        it "should evaluate red moves in col 1  given a grid" $ do
            let g = grid ["......."
                         ,"......."
                         ,"......."
                         ,".*....."
                         ,".*....."
                         ,".*....."]
                e = eval g Red 
            e!!1 `shouldBe` (1,victory)


