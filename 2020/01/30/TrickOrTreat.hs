import Test.Hspec

import Data.Function ((&))
import Data.List (sort, group)

main = hspec $ do
    describe "The treat or trick kata" $ do
        it "has a canary" $ do
            1 `shouldBe` 1
        it "two children, happy scenario" $ do
            distribute 2 [["Candy", "Candy"]
                         ,["Candy", "Candy"]
                         ]
                `shouldBe` "Thank you, strange uncle!" 
            distribute 3 [["Candy", "Candy"]
                         ,["Candy", "Candy"]
                         ,["Candy", "Candy"]
                         ]
                `shouldBe` "Thank you, strange uncle!" 
            distribute 3 [["Candy", "Candy", "Candy"]
                         ,["Candy", "Candy", "Candy"]
                         ,["Candy", "Candy", "Candy"]
                         ]
                `shouldBe` "Thank you, strange uncle!" 
        it "does not work when there are less bags than children" $ do
            distribute 2 []
                `shouldBe` "Tricks or treats"
            distribute 2 [["Candy", "Candy"]]
                `shouldBe` "Tricks or treats"
            distribute 2 [[]]
                `shouldBe` "Tricks or treats"
        it "empty bags" $ do
            distribute 2 [[], []]
                `shouldBe` "Tricks or treats"
        it "kids gets keep one apple" $ do
            distribute 2 [["Apple"]
                         ,["Apple"]
                         ]
                `shouldBe` "Tricks or treats"
        it "kids gets one apple one candy" $ do
            distribute 2 [["Apple", "Candy"]
                         ,["Apple", "Candy"]
                         ]
                `shouldBe` "Tricks or treats"
        it "kids don't like bombs" $ do
            distribute 3 [["Candy", "Candy", "Candy"]
                         ,["Candy", "Candy", "Candy", "Bomb"] -- EVIL LAUGH
                         ,["Candy", "Candy", "Candy"]
                         ]
                `shouldBe` "Tricks or treats" 
        it "kids should receive the same number of candies" $ do
            distribute 3 [["Candy", "Candy", "Candy"]
                         ,["Candy", "Candy"]
                         ,["Candy", "Candy", "Candy"]
                         ]
                `shouldBe` "Tricks or treats" 

type Treat = String
type Bag = [Treat]
type Answer = String

-- `|' means such that
distribute :: Int -> [Bag] -> Answer
distribute children bags 
    | (compliant bags & map nbCandies & sort & group & map length & foldl max 0) >= children = "Thank you, strange uncle!" 
distribute _ _ = "Tricks or treats"

compliant = filter isCompliant

isCompliant :: Bag -> Bool
isCompliant bag | "Bomb" `elem` bag = False
isCompliant bag = length (filter keepCandies bag) >= 2 

keepCandies :: Treat -> Bool
keepCandies treat = treat == "Candy"    

nbCandies bag =
    bag 
    & filter keepCandies
    & length
