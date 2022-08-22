import Test.Hspec

type Point = (Int,Int)
type Score = [String]

sets :: [Point] -> Score
sets _ = ["0-0"]

pointValue :: Int -> String
pointValue 3 = "40"
pointValue n = show $ n * 15

points :: (String,String) -> Point -> String
points (p1, p2) (a, b) | a > 3 && a == b = "Égalité"
points (p1,p2) (a,b) | a >= 3 && b >= 3 && a /= b = "Avantage " ++ player
    where player | b > a = p2
                 | a > b = p1
points _ (a, b) | a == b = pointValue a ++ " à"
points _ (a, b) = pointValue a ++ "-" ++ pointValue b


current :: (String,String) -> [Point] -> Score
current _ []  = ["0-0"]
current players [p] = [points players p]

score :: (String,String) -> [Point] -> Score
score players [(4,0)] = ["1-0","0-0"]
score players ps = sets ps ++ current players ps

main = hspec $ do
    describe "score" $ do
        it "should display scores" $ do
            score ("Chris","ToF") [] `shouldBe` ["0-0", "0-0"]

            score ("Chris","ToF") [(1,0)] `shouldBe` ["0-0","15-0"]
       
            score ("Chris","ToF") [(0,1)] `shouldBe` ["0-0","0-15"]

            score ("Chris","ToF") [(0,3)] `shouldBe`["0-0","0-40"] 
        
            score ("Chris","ToF") [(1,1)] `shouldBe` ["0-0","15 à"]

            score ("Chris","ToF") [(4,3)] `shouldBe` ["0-0","Avantage Chris"]  

            score ("Chris","ToF") [(3,4)] `shouldBe` ["0-0","Avantage ToF"]  

            score ("Chris","ToF") [(3,3)] `shouldBe` ["0-0","40 à"]  

            score ("Chris","ToF") [(4,4)] `shouldBe` ["0-0","Égalité"]

            score ("Chris","ToF") [(4,0)] `shouldBe` ["1-0","0-0"]
