{-# LANGUAGE DeriveAnyClass, DeriveGeneric #-}
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck.Arbitrary
import Test.QuickCheck.Arbitrary.Generic
import Test.QuickCheck
import Data.Foldable
import GHC.Generics

type Coordinates = (Int, Int, Cardinals)

executeOrder :: Coordinates -> Char -> Coordinates
executeOrder (x, y, orientation)  'L' = (x, y,      predr orientation)
executeOrder (x, y, orientation) 'R'  = (x, y,      succr orientation)
executeOrder (x, y, West) 'M'         = (pred x, y, West)
executeOrder (x, y, East) 'M'         = (succ x, y, East)
executeOrder (x, y, South) 'M'        = (x, pred y, South)
executeOrder (x, y, North) 'M'        = (x, succ y, North)

executeOrders :: Coordinates -> String -> Coordinates
executeOrders pos orderList = foldl' executeOrder pos orderList

data Cardinals = North | East | South | West
  deriving (Show, Eq, Enum, Bounded, Cyclic)


class (Enum x, Bounded x, Eq x) => Cyclic x where
  succr :: x -> x
  succr a = if a == maxBound
            then minBound
            else succ a
  predr :: x -> x
  predr a = if a == minBound
            then maxBound
            else pred a


instance Arbitrary Cardinals where
  arbitrary = elements [ North , East , South , West]

main :: IO ()
main = hspec $ do
  describe "The Mars Rover" $ do
    it "doesn't move given an empty order list_" $ property $ do
      \x -> executeOrders x "" `shouldBe` x

    it "turns right North" $ property $
      \x y -> executeOrders (x,y,North) "R" `shouldBe` (x,y,East)
    it "turns right East" $ property $
      \x y -> executeOrders (x,y,East) "R" `shouldBe` (x,y,South)
    it "turns right South" $ property $
      \x y -> executeOrders (x,y,South) "R" `shouldBe` (x,y,West)
    it "turns right West" $ property $
      \x y -> executeOrders (x,y,West) "R" `shouldBe` (x,y,North)

    it "turns left North" $ property $
      \x y -> executeOrders (x,y,North) "L" `shouldBe` (x,y,West)
    it "turns left East" $ property $
      \x y -> executeOrders (x,y,East) "L" `shouldBe` (x,y,North)
    it "turns left South" $ property $
      \x y -> executeOrders (x,y,South) "L" `shouldBe` (x,y,East)
    it "turns left West" $ property $
      \x y -> executeOrders (x,y,West) "L" `shouldBe` (x,y,South)

    it "turns left multiple times" $
      executeOrders (0, 0, North) "LL" `shouldBe` (0, 0, South)

    it "doesn't move given an idempotent order list" $ property $
      \coord n -> 
        let ls = replicate n 'L'
            rs = replicate n 'R'
        in executeOrders coord (ls <> rs) `shouldBe` coord
    
    it "moves forward" $ do
      executeOrders (0, 0, North) "M" `shouldBe` (0, 1, North)
      executeOrders (0, 0, South) "M" `shouldBe` (0, -1, South)
      executeOrders (0, 0, East) "M" `shouldBe` (1, 0, East)
      executeOrders (0, 0, West) "M" `shouldBe` (-1, 0, West)

