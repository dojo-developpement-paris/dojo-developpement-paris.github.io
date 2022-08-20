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
            g!!0!!0 `shouldBe` Just Yellow
            g!!1!!0 `shouldBe` Just Red
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
