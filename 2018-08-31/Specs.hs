import Test.Hspec
import Snake

main = hspec $ do
    describe "snake" $ do
        let mySnake = snake gameState 
        describe "initially" $ do
            it "should be 3 cells long" $ do
                length mySnake `shouldBe` 3   

            it "moves automatically to the right" $ do
    
                let mySnake' = move East mySnake
                let mySnake'' = move East mySnake'

               
                mySnake  `shouldBe` [(0,0),(0,1),(0,2)]
                mySnake' `shouldBe` [(0,1),(0,2),(0,3)]
                mySnake''`shouldBe` [(0,2),(0,3),(0,4)]

        describe "moves" $ do
            it "to the south also" $ do
                let mySnake' = move South mySnake
                mySnake' `shouldBe` [(0,1),(0,2),(-1,2)]
            it "to the south then west" $ do
                let mySnake' = move West (move South mySnake)
                mySnake'`shouldBe` [(0,2),(-1,2),(-1,1)] 

            it "to the north also" $ do
                let mySnake' = move North mySnake
                mySnake' `shouldBe` [(0,1),(0,2),(1,2)]

    describe "gameState" $ do
            describe "has a direction" $ do
                it "which is initially East" $ do
                    let g = gameState
                    direction g `shouldBe` East

            describe "has a snake" $ do
                it "which is initially in 00 01 02" $ do
                    let g = gameState
                    snake g `shouldBe` [(0,0),(0,1),(0,2)] 

                

        
