module SpiralSpec (spec) where

--      -2  -1    0   1   2
--
-- 2    17  16  15  14  13
-- 1    18   5   4   3  12
-- 0    19   6   1 → 2  11  
-- -1   20   7   8   9 →10  27
-- -2   21  22  23  24  25  26 ---> ...
--                          49
--                             81 
--                                
-- ring # n = goes n times in one dir. then n+1 times in 3 other dirs.
--

import Test.Hspec
import Spiral

spec :: SpecWith ()
spec = do
  describe "test harness" $ do
    it "should manifest its presence" $ do
      (2+2)  `shouldBe` (4 :: Int)

  it "distances" $ do
      distance 1 `shouldBe` 0
      distance 2 `shouldBe` 1
      distance 3 `shouldBe` 2
      distance 4 `shouldBe` 1 
      distance 5 `shouldBe` 2
      distance 6 `shouldBe` 1
      distance 7 `shouldBe` 2
      distance 8 `shouldBe` 1
      distance 9 `shouldBe` 2

  describe "moves" $ do
    it "on ring #1" $ do
      moves 1 `shouldBe` [right]
    it "on ring #2" $ do
      moves 2 `shouldBe` [up,left,left,down,down,right,right,right]
    it "on ring #3" $ do
      moves 3 `shouldBe` [up,up,left,left,left,down,down,down,right,right,right,right]

  describe "movesTo" $ do
    it "should list all moves to get there" $ do
      movesTo 3 `shouldBe` [right, up]
