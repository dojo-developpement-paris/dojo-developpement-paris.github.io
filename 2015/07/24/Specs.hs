import Test.Hspec

type Road = Int
type Gap = Int
type Platform = Int
type Position = Int
type Velocity = Int

data Context = Context Road Gap Platform
data Bike    = Bike Position Velocity 
data Action  = JUMP | SPEED | WAIT | SLOW
  deriving (Eq, Show)

action :: Context -> Bike -> Action
--action (Context r g a) (Bike p s)
action (Context r g _) (Bike p s) | p >= r + g = SLOW
action (Context r g _) (Bike p s) | r + g <= p + s = JUMP
action (Context _ g _) (Bike _ s) | s > g = WAIT
action _ _ = SPEED


main = hspec $ do
    describe "bike command" $ do
        it "jumps even if it's gonna land in a ditch" $ do
            action (Context 1 1 1) (Bike 0 2) `shouldBe` JUMP
            action (Context 3 1 3) (Bike 2 2) `shouldBe` JUMP
        it "speeds if zero position and speed" $ do
            action (Context 1 1 1) (Bike 0 0) `shouldBe` SPEED
        it "accelerates until speed is good" $ do
            action (Context 3 1 3) (Bike 0 1) `shouldBe` SPEED
        it "waits when speed is ok" $ do
            action (Context 3 1 3) (Bike 0 2) `shouldBe` WAIT
            action (Context 5 1 3) (Bike 0 2) `shouldBe` WAIT
            action (Context 5 1 4) (Bike 0 2) `shouldBe` WAIT
            action (Context 7 2 8) (Bike 0 3) `shouldBe` WAIT
        it "slows down when the speed is too high to jump before the gap" $ do
            action (Context 7 1 8) (Bike 8 4) `shouldBe` SLOW
            action (Context 9 1 8) (Bike 10 5) `shouldBe` SLOW

