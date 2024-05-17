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

            it "after player A and B score, the score is 15 to 15" $ do
                score (playerBScore (playerAScore newGame)) `shouldBe` (Fifteen, Fifteen)

type Game = Int

data Point = Love | Fifteen
    deriving (Eq, Show)

newGame :: Game
newGame = 0

score :: Game -> (Point, Point)
score 0 = (Love, Love)
score 1 = (Fifteen, Love)
score _ = (Love, Fifteen)

playerAScore :: Game -> Game
playerAScore _ = 1

playerBScore :: Game -> Game
playerBScore _ = 2
