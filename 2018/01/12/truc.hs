import Test.Hspec

main = hspec $ do
    describe "Sokoban" $ do
-- la chose la plus simple pour commencer
-- caisse sur un emplacement final > sokoban résolu
-- un espace de fin libre > pas résolu
        describe "Solution" $ do
            it "Puzzles with remaining targets aren't solved" $ do
                solved (Puzzle (0,0) [[Target]]) `shouldBe` False
                solved (Puzzle (0,0) [[Empty, Target]]) `shouldBe` False
                solved (Puzzle (0,0) [[], [Empty, Target]]) `shouldBe` False
            it "Puzzles without remaining targets are solved" $ 
                solved (Puzzle (0,0) [[Stored]]) `shouldBe` True
        describe "moves" $ do 
            describe "move" $ do
                it "moves the worker one room ahead" $ do
                    let west = Puzzle (0,0) [[Empty, Target, Empty]]
                    let east = Puzzle (1,0) [[Empty, Target, Empty]] 
                    let superEast = Puzzle (2,0) [[Empty, Target, Empty]] 
                    move (west) East `shouldBe` east
                    move east West `shouldBe` west 
                    move east East `shouldBe` superEast
-- une dimension c'est  pas assez
type Coord = (Int, Int)

data Room = Target 
          | Crate
          | Stored -- a Target and a Crate
          | Wall
          | Empty
  deriving (Eq, Show)

data Puzzle = Puzzle { pos :: Coord, rooms :: [[Room]] }
    deriving(Eq,Show)
data Direction = East | West

solved :: Puzzle -> Bool
solved (Puzzle _ rooms) = not $ Target `elem` concat rooms

move p@(Puzzle (x, y) _) East = Puzzle (x + 1, 0) (rooms p)
move p West = Puzzle (0, 0) (rooms p)
