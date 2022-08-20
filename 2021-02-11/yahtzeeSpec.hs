import Test.Hspec
import Data.List
import Data.Function((&))

data Category = Chance 
    | Number Int 
    | Yahtzee 
    | Pair 
    | TwoPairs
    | ThreeOfAKind
    deriving (Eq)

yahtzeeScore Chance xs = sum xs

yahtzeeScore (Number n) xs = sum $ filter (== n) xs

yahtzeeScore Yahtzee xs | allDicesHaveSameValue = 50
                        | otherwise = 0
                        where allDicesHaveSameValue = length (nub xs) == 1
                                                      
yahtzeeScore TwoPairs xs             -- [2,3,3,3,2]
    = extract Pair xs                -- [4,6]
    & f (\x -> length x == 2)        -- [4, 6]
    & sum                            -- 10

yahtzeeScore pattern xs 
    = extract pattern xs                -- [4,6]
    & (0:)                              -- [0,4,6]
    & maximum                           -- 6

extract pattern xs                              -- [2,3,3,3,2]
    = sort xs                                   -- [2,2,3,3,3]
    & group                                     -- [[2,2],[3,3,3]]
    & filter (\x -> length x >= desiredLength)  -- [[2,2],[3,3,3]]
    & map (take desiredLength)                  -- [[2,2],[3,3]]
    & map sum                                   -- [4, 6]
    where desiredLength | pattern == Pair = 2
                        | pattern == ThreeOfAKind = 3

f :: ([Int] -> Bool) -> [Int] -> [Int]
f p xs | p xs = xs
       | otherwise = [0]

main = hspec $ do
    describe "Yahtzee score" $ do
        describe "Chance" $ do
            it "should sum all the dice" $ do
                yahtzeeScore Chance [1,2,3,4,5] `shouldBe` 15
                yahtzeeScore Chance [1,1,1,1,1] `shouldBe` 5
        describe "Numbers" $ do
            it "should sum all the dice with number 1" $ do
                yahtzeeScore (Number 1) [1,2,3,4,5] `shouldBe` 1
                yahtzeeScore (Number 1) [1,1,3,4,5] `shouldBe` 2
            it "should sum all the dice with number 2" $ do
                yahtzeeScore (Number 2) [1,2,2,2,5] `shouldBe` 6
            it "should sum all the dice with number 3" $ do
                yahtzeeScore (Number 3) [1,3,3,2,5] `shouldBe` 6
            it "should sum all the dice with number 4" $ do
                yahtzeeScore (Number 4) [1,3,4,2,5] `shouldBe` 4
            it "should sum all the dice with number 5" $ do
                yahtzeeScore (Number 5) [1,3,4,2,5] `shouldBe` 5
            it "should sum all the dice with number 6" $ do
                yahtzeeScore (Number 6) [1,3,4,2,6] `shouldBe` 6
        describe "Yahtzee" $ do
            it "should give 50 when all the same numbers" $ do
                yahtzeeScore Yahtzee [1,1,1,1,1] `shouldBe` 50
                yahtzeeScore Yahtzee [1,1,1,1,2] `shouldBe` 0
        describe "Single Pair" $ do
            it "should compute the sum of the highest pair" $ do
                yahtzeeScore Pair [1,2,3,4,4] `shouldBe` 8
                yahtzeeScore Pair [4,4,3,3,3] `shouldBe` 8
                yahtzeeScore Pair [2,2,1,3,4] `shouldBe` 4
                yahtzeeScore Pair [2,2,3,3,3] `shouldBe` 6
                yahtzeeScore Pair [1,2,3,4,5] `shouldBe` 0
        describe "Two Pairs" $ do
            it "should compute the sum of the pairs" $ do
                yahtzeeScore TwoPairs [1,3,3,4,4] `shouldBe` 14
                yahtzeeScore TwoPairs [1,3,3,5,5] `shouldBe` 16
                yahtzeeScore TwoPairs [1,2,3,4,5] `shouldBe` 0
                yahtzeeScore TwoPairs [1,3,3,4,5] `shouldBe` 0
        describe "Three of a kind" $ do
            it "should compute the sum of the three dices" $ do
                yahtzeeScore ThreeOfAKind [3,3,3,4,4] `shouldBe` 9
                yahtzeeScore ThreeOfAKind [3,3,4,4,4] `shouldBe` 4*3
