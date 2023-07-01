import Test.Hspec
import Data.Function ((&))
import Sokoban

--  type Coord = (Int,Int)
--  empty :: Sokoban
--  wall :: Coord -> Sokoban -> Sokoban
--  box :: Coord -> Sokoban -> Sokoban
--  storage :: Coord -> Sokoban -> Sokoban
--  player :: Coord -> Sokoban -> Sokoban
--  left :: Sokoban -> Sokoban
--  right :: Sokoban -> Sokoban
--  up :: Sokoban -> Sokoban
--  down :: Sokoban -> Sokoban
--  solved :: Sokoban -> Bool
--  data Thing = Player | Box | Storage | Wall
--  warehouse_map :: Sokoban -> [(Coord, Thing)]

-- internal API
--  wall :: Coord -> SokoBrick
--  box_and_storage :: Coord -> Coord -> SokoBrick
--  player :: Coord -> SokoBrick
--  validate :: SokoBrick -> Maybe Sokoban
--  SokoBrick is a SemiGroup e.g 2 walls make a SokoBrick
--
main = hspec $ do

    describe "acceptance" $ do

        it "a sokoban with 1 box on its storage is solved" $ do
            let sokoban = (box (2,0) <> storage (2,0)) 
            solved sokoban `shouldBe` True

            let sokoban = (storage (2,0) <> box (2,0)) 
            solved sokoban `shouldBe` True

            let sokoban = (box (3,0) <> storage (3,0) <> box (2,4) <> storage (2,4)) 
            solved sokoban `shouldBe` True

            let sokoban = (box (3,0) <> storage (3,0) <> box (9,9) <> storage (2,4)) 
            solved sokoban `shouldBe` False

        xit "acceptance test #1" $ do
            let sokoban = (box (1,0)
                           <> storage (2,0)
                           <> player (0,0)
                           & right)
            solved sokoban `shouldBe` True
