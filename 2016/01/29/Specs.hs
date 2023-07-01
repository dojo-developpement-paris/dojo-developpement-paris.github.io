import Test.Hspec
import Data.List (transpose)

type Board = [[Cell]]
data Cell = Empty | Queen
  deriving (Eq)

validate :: Board -> Bool
validate b = all validBoard [b, b']
  where b'          = transpose b
        validBoard  = all ((< 2) . countQueens)
        countQueens = length . filter (== Queen)

main = hspec $ do
  describe "8 Queens" $ do
    describe "validate" $ do
      it "is perfectly valid with just one queen" $ do
        validate [[Queen]] `shouldBe` True
      it "is invalid with several queens on the same line" $ do
        validate [[Queen, Queen],[Empty,Empty]] `shouldBe` False
        validate [[Queen, Queen]] `shouldBe` False
        validate [[Queen, Empty, Queen]] `shouldBe` False
        validate [[Empty, Queen, Queen]] `shouldBe` False
        validate [[Empty, Empty],[Queen,Queen]] `shouldBe` False
      it "is invalid with several queens on the same column" $ do
        validate [[Queen,Empty],[Queen,Empty]] `shouldBe` False
