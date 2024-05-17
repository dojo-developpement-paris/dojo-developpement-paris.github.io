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

            it "after player A scores, the score is 15 to Love" $ do
                score (playerAScore newGame) `shouldBe` (Fifteen, Love)

            it "after player B scores, the score is Love to 15" $ do
                score (playerBScore newGame) `shouldBe` (Love, Fifteen)

data Point = Love | Fifteen
    deriving (Eq, Show)

type Game = (Point, Point)

newGame :: Game
newGame = (Love, Love)

score :: Game -> (Point, Point)
score (Love, Love) = (Love, Love)
score (Fifteen, Love) = (Fifteen, Love)
score _ = (Love, Fifteen)

playerAScore :: Game -> Game
playerAScore _ = (Fifteen, Love)

playerBScore :: Game -> Game
playerBScore _ = (Love, Fifteen)