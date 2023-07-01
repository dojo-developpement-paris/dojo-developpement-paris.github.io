import Test.Hspec
import Prelude hiding (Right, Left)
import Data.List ((\\))

type Universe = ([Coord], Orientation, Coord)

data Action = TurnRight
            | TurnLeft
    deriving (Eq, Show)

data Color = White
           | Black

data Coord = Coord Int Int 
    deriving (Eq, Show)

data Orientation = Top
                 | Right
                 | Bottom
                 | Left
    deriving (Eq, Show, Enum)

actionOn :: Color -> Action
actionOn White = TurnRight
actionOn _     = TurnLeft

nextOrientation :: Orientation -> Action -> Orientation
nextOrientation Left        TurnRight = Top
nextOrientation Top         TurnLeft  = Left
nextOrientation orientation TurnRight = succ orientation
nextOrientation orientation TurnLeft  = pred orientation

moveForward :: Coord -> Orientation -> Coord
moveForward (Coord h v) Top    = Coord h     (v+1) 
moveForward (Coord h v) Left   = Coord (h-1) v
moveForward (Coord h v) Right  = Coord (h+1) v
moveForward (Coord h v) Bottom = Coord h     (v-1)

evolve :: Universe -> Universe
evolve (painted, orientation, coord) = case coord `elem` painted of
    True  -> (newPainted, newOrientation ,  moveForward coord newOrientation ) 
        where
        newPainted = painted \\ [coord]
        newOrientation = nextOrientation orientation TurnLeft
    False -> (newPainted , newOrientation , moveForward coord newOrientation )
        where
        newPainted = painted ++ [coord]
        newOrientation = nextOrientation orientation TurnRight

main = hspec $ do
    describe "an ant" $ do 
        it "given a white square, turn right" $ do
            actionOn White  `shouldBe` TurnRight

        it "given a black square, turn left" $ do
            actionOn Black  `shouldBe` TurnLeft

    describe "next orientation" $ do
        it "given an orientation and a TurnRight, return a new orientation" $ do
            nextOrientation Top   TurnRight `shouldBe` Right
            nextOrientation Right TurnRight `shouldBe` Bottom
            nextOrientation Bottom TurnRight `shouldBe` Left
            nextOrientation Left TurnRight  `shouldBe` Top 

        it "given an orientation and a TurnLeft, return a new orientation" $ do
            nextOrientation Top    TurnLeft `shouldBe` Left
            nextOrientation Right  TurnLeft `shouldBe` Top
            nextOrientation Bottom TurnLeft `shouldBe` Right
            nextOrientation Left   TurnLeft `shouldBe` Bottom

    describe "move forward" $ do
        it "given a coord and an orientation, move forward" $ do
            moveForward (Coord 0 0) Top     `shouldBe` Coord 0 1
            moveForward (Coord 10 1) Top    `shouldBe` Coord 10 2
            moveForward (Coord 1 1) Left    `shouldBe` Coord 0 1
            moveForward (Coord 1 1) Right   `shouldBe` Coord 2 1
            moveForward (Coord 1 1) Bottom  `shouldBe` Coord 1 0

    describe "move anywhere" $ do
        it "given an universe, creates a new universe " $ do
            evolve ( []
                   , Top
                   , (Coord 0 0)
                   ) 
                `shouldBe`  
                    ( [(Coord 0 0)]
                    , Right
                    , (Coord 1 0)
                    )

            evolve ([Coord 0 0]
                   ,Right
                   ,Coord 1 0)
                `shouldBe`  
                  ([Coord 0 0, Coord 1 0]
                  ,Bottom
                  ,Coord 1 (-1))

        it "the ant should unpaint an already painted cell" $ do
            evolve ([Coord 0 0, Coord 1 0]
                   ,Right
                   ,Coord 0 0)
                `shouldBe`  
                  ([Coord 1 0]
                  ,Top
                  ,Coord 0 1)
            
