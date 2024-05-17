module Main (main) where

import Test.Hspec

-- Each player can have either of these points in one game “love” “15” “30” “40”
-- If you have 40 and you win the point you win the game, however there are special rules.
-- If both have 40 the players are “deuce”.
-- If the game is in deuce, the winner of a point will have advantage
-- If the player with advantage wins the ball he wins the game
-- If the player without advantage wins they are back at deuce.

main :: IO ()
main =
    hspec $ do
        describe "score" $ do
            it "is love love initially" $ do
                score newGame `shouldBe` (Love, Love)

type Game = Int

data Point = Love
    deriving (Eq, Show)

newGame :: Game
newGame = 0

score :: Game -> (Point, Point)
score _ = (Love, Love)
