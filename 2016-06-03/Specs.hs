import Test.Hspec
import PythTree

roundPoint :: Point -> Point
roundPoint (x,y) = (rounded x, rounded y)
    where
    rounded :: Double -> Double
    rounded n = fromIntegral (round (n * 10000))/10000 

rounds :: [Point] -> [Point]
rounds = map roundPoint

main = hspec $ do
    describe "render" $ do
        it "should render a list of polygons, even empty" $ do
            render 450 450 [] `shouldBe` 
                "<html><body><svg width=\"450\" height=\"450\"></svg></body></html>"

        it "should have the view size in parameters" $ do
            render 300 400 []  `shouldBe` 
                "<html><body><svg width=\"300\" height=\"400\"></svg></body></html>"

        it "should render a shape" $ do
            render 300 400 [[(0,0),(100,0),(0,100)]]
             `shouldBe` 
                "<html><body><svg width=\"300\" height=\"400\">"
               ++"<polygon points=\"0.0,0.0 100.0,0.0 0.0,100.0\" style=\"fill:white;stroke:black\"/>"
               ++ "</svg></body></html>"

            render 300 400 [[(0,0),(50,0),(30,50)]]
             `shouldBe` 
                "<html><body><svg width=\"300\" height=\"400\">"
               ++"<polygon points=\"0.0,0.0 50.0,0.0 30.0,50.0\" style=\"fill:white;stroke:black\"/>"
               ++ "</svg></body></html>"

        it "should render several shapes" $ do
            render 300 400 [[(0,0),(50,0),(30,50)],[(0,50),(50,0)]]
             `shouldBe` 
                "<html><body><svg width=\"300\" height=\"400\">"
               ++"<polygon points=\"0.0,0.0 50.0,0.0 30.0,50.0\" style=\"fill:white;stroke:black\"/>"
               ++"<polygon points=\"0.0,50.0 50.0,0.0\" style=\"fill:white;stroke:black\"/>"
               ++ "</svg></body></html>"


    describe "square" $ do
        it "should create a square shape" $ do
            square (0.0,0.0) 100.0 `shouldBe` 
                [(0.0,0.0),(100.0,0.0),(100.0,100.0),(0.0,100.0)]

    describe "right triangle" $ do
        it "should create a right triangle" $ do
            rounds (rightTriangle (0,0) 2.0 (pi/4))
             `shouldBe` [(0.0,0.0),(2.0,0.0),(1.0,1.0)]

    describe "house" $ do
        it "should draw a right triangle on top of a square" $ do
            (rounds (house (0,0) 2.0 (pi/4)))
             `shouldBe` [(0,0),(2.0,0.0),(2.0,2.0),(1.0,3.0),(0.0,2.0)]

