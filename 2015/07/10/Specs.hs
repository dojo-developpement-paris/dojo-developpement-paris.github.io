import Test.Hspec
import Data.List(sort)

type City = Int
type Road = (City, City)
type Network = [Road]

travel :: [Road] -> [City]
travel [] = []
travel [(x,y)] = [x,y]
travel [r1@(x,y),(z,y')] |y==y'= [x,y,z,y']
                      | otherwise = travel [r1,(y',z)]

neighbors :: City -> Network -> [City]
neighbors c rs =  map destination . filter (roadFrom c) $ rs ++ rs'
    where rs' = map (\(x, y) -> (y, x)) rs

           
roadFrom :: City -> Road -> Bool  
roadFrom city (x,_) = city == x 

destination = snd


main = hspec $ do
    describe "a salesman" $ do
        it "should not travel if there is no city" $ do
            travel [] `shouldBe` [] 

        it "should find one road between two cities" $ do
            travel [(1,2)] `shouldBe` [1,2]
            travel [(1,3)] `shouldBe` [1,3]

        it "should find one route between three cities" $ do
            travel [(1,2),(2,3)] `shouldBe` [1,2,3,2]
            travel [(1,3),(3,4)] `shouldBe` [1,3,4,3]
            travel [(1,3),(2,3)] `shouldBe` [1,3,2,3]
            travel [(1,4),(2,4)] `shouldBe` [1,4,2,4]

    describe "connected cities" $ do
        it "should find the connected cities of one city" $ do
           neighbors 1 [(1,2),(1,3),(2,4)] `shouldMatchList` [2,3]
           neighbors 2 [(1,2),(1,3),(2,4)] `shouldMatchList` [1,4]
