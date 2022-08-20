import Test.Hspec
import TicTacToe

main = hspec $ do
    describe "check" $ do
        it "knows when game is still in progress" $ do
            check emptyGame  `shouldBe` inProgress

        it "knows when X won" $ do
            let g = game ["XXX"
                         ,"O.O"
                         ,"..."]
            check g  `shouldBe` (wonBy X)

            let g =game ["..."
                        ,"O.O"
                        ,"XXX"]
            check g  `shouldBe` (wonBy X)

            let g =game ["X.."
                        ,"X.O"
                        ,"XO."]
            check g  `shouldBe` (wonBy X)

            let g =game ["X.."
                        ,".X."
                        ,"OOX"]
            check g  `shouldBe` (wonBy X)

            let g =game ["..X"
                        ,".X."
                        ,"XOO"]
            check g  `shouldBe` (wonBy X)

        it "knows when O won" $ do
            let g =game ["O.."
                        ,".O."
                        ,"XXO"]
            check g  `shouldBe` (wonBy O)

        it "knows when a game is Tie" $ do
            let g = game ["XOO"
                         ,"OXX"
                         ,"XXO"]
            check g  `shouldBe` Tie 

        describe "moves" $ do
            it "should list all moves in an empty game" $ do
                moves emptyGame `shouldBe`
                 [(i,j)| i <- [0,1,2], j <- [0,1,2]]

            it "should detect remaining moves" $ do
                let g = game ["X.."
                             ,".OO"
                             ,"XX."]
                moves g `shouldBe` [(0,1),(0,2),(1,0),(2,2)]

    
