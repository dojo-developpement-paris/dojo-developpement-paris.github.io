import Test.Hspec
import Data.List
import Data.Maybe

main = hspec $ do
  describe "solver for labyrinth" $ do
    describe "for simple cases" $ do
      it "solves trivial cases" $ do
        let solve' = fromJust . solve
        solve' ["SX"] `shouldBe` "E"
        solve' ["S X"] `shouldBe` "EE"
        solve' ["S  X"] `shouldBe` "EEE"
        solve' ["XS"] `shouldBe` "W"
        solve' ["X S"] `shouldBe` "WW"
        solve' ["X",
               "S"] `shouldBe` "N"
        solve [""] `shouldBe` Nothing

solve :: [String] -> Maybe String
solve ["X", "S"] = Just "N"
solve [line] | not $ elem 'X' line  = Nothing
solve [line] | indexOf line 'X' > indexOf line 'S' =
  fmap ('E':) $ solve [fromJust $ moveEast line]
solve [line] | indexOf line 'X' < indexOf line 'S' = 
  fmap ('W':) $  solve [fromJust $ moveWest line]

moveWest :: String -> Maybe String
moveWest line | head line == 'S' = Nothing
moveWest line = Just $ kept ++ "S#" ++ unseen
  where 
  unseen = dropWhile (/= 'S') line
  seen = takeWhile (/= 'S') line
  kept = take (length seen - 1) seen


moveEast :: String -> Maybe String
moveEast line | last line == 'S' = Nothing
moveEast line = Just $ seen ++ "#S" ++ unseen
  where 
  unseen = drop 2 $ dropWhile (/= 'S') line
  seen = takeWhile (/= 'S') line
  

indexOf :: String -> Char -> Int
indexOf line c = fromJust $ elemIndex c line
