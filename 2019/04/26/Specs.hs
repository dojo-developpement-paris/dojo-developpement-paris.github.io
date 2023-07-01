import Test.Hspec
import Prelude hiding (Left, Right)
import Data.List (transpose)

type Grid = [Line]
type Line = [Cell]
type Cell = Int
type Length = Int
data Direction = Left | Right | Up | Down

move :: Direction -> Grid -> Grid
move Left  = map moveLine 
move Right = map (reverse . moveLine . reverse) 
move Up    = transpose . move Left . transpose
move Down  = transpose . move Right . transpose

moveLine line = pad (length line) (mergeDoubles (removeZeroes line))
mergeDoubles (x:y:xs) | x == y  = x+y : mergeDoubles xs
mergeDoubles (x:xs)             = x   : mergeDoubles xs
mergeDoubles [] = []

pad :: Length -> Line -> Line
pad l list = take l (list ++ repeat 0)

removeZeroes = filter (/=0) 

shouldMoveTo g h = move Left g  `shouldBe` h

main = hspec $ do
    describe "move left" $ do
        it "on the left pushes number to the left" $ do
          [[0,2]] `shouldMoveTo` [[2,0]]
          [[0,4]] `shouldMoveTo` [[4,0]]  
          [[0,4,0]] `shouldMoveTo` [[4,0,0]]  
          [[2,0,4]] `shouldMoveTo` [[2,4,0]]  

        it "doesn't move Left cells that can't merge" $ do
          [[2,4]] `shouldMoveTo` [[2,4]]
          [[4,2]] `shouldMoveTo` [[4,2]]

        it "merges two identical cells and double their value" $ do
            [[2,2]] `shouldMoveTo` [[4,0]]
            [[2,0,2]] `shouldMoveTo` [[4,0,0]]
            [[4,4]] `shouldMoveTo` [[8,0]]
            [[2,2,4]] `shouldMoveTo` [[4,4,0]]
            [[4,2,2]] `shouldMoveTo` [[4,4,0]]
            [[2,2,2,2]] `shouldMoveTo` [[4,4,0,0]]

        it "merges several lines" $ do
            let grid = [[2,2]
                       ,[4,4]
                       ,[2,0]]
            move Left grid  `shouldBe` [[4,0]
                                  ,[8,0]
                                  ,[2,0]]  

        it "moves on the right" $ do
            let grid = [[2,2]
                       ,[4,4]
                       ,[2,0]]
            move Right grid  `shouldBe` [[0,4]
                                        ,[0,8]
                                        ,[0,2]]  

        it "moves upward" $ do
            let grid = [[2,2]
                       ,[2,0]
                       ,[4,2]]
            move Up grid  `shouldBe` [[4,4]
                                     ,[4,0]
                                     ,[0,0]] 

        it "moves downward" $ do
            let grid = [[2,2]
                       ,[2,0]
                       ,[4,2]]
            move Down grid  `shouldBe` [[0,0]
                                       ,[4,0]
                                       ,[4,4]] 

            
