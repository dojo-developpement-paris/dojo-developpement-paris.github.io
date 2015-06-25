import Test.Hspec
import Turtle

roundedCoords :: Turtle-> (Int, Int)
roundedCoords t = (round x, round y)
    where (x,y) = coords t

main = hspec $ do
    describe "turtle" $ do
        it "has a position" $ do
            coords turtle `shouldBe` (0,0)

        it "should execute a forward command" $ do
            coords (turtle `execute` (FD 100)) `shouldBe` (100,0) 
            coords (turtle `execute` (FD 200)) `shouldBe` (200,0)
            coords ((turtle `execute` (FD 3)) `execute` (FD 6)) `shouldBe` (9,0)

        it "should execute a turn left command" $ do
            roundedCoords (foldl execute turtle [TL (pi/2), FD 100]) `shouldBe` (0,100)

        it "should execute a turn right command" $ do
            roundedCoords (foldl execute turtle [TR (pi/2), FD 100]) `shouldBe` (0,-100)

    describe "svgPath" $ do
        it "converts a list of coords to a svg path" $ do
            svgPath [(0,0),(100,42)] `shouldBe` "<path d=\"M0.0 0.0 L100.0 42.0\" />"
            svgPath [(5,5),(10,420)] `shouldBe` "<path d=\"M5.0 5.0 L10.0 420.0\" />"
            
    describe "trace" $ do
        it "converts a list de commands into a svg path" $ do
            trace [FD 100, TL pi, FD 50] `shouldBe` "<path d=\"M0.0 0.0 L100.0 0.0 L100.0 0.0 L50.0 6.123031769111886e-15\" />" 


