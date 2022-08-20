import Test.Hspec
import qualified Data.Map as Map

data Cell = Wall | Player
    deriving(Eq, Show)

type Coord = (Int, Int)

data Sokoban = S { world :: Map.Map Coord Cell
                 , player :: Maybe Coord       
                 } 


parse :: [String] -> Sokoban
parse p = S { world = Map.fromList $ concat $ zipWith parseLine [0..] p 
            , player = Just (0,0)
            }  
  where parseLine l = zip (zip (repeat l) [0..]) . map charToCell 
        charToCell _   = Wall

main = hspec $ do
  describe "parse" $ do
    it "convert string puzzle to internal representation" $ do
      world ( parse ["#"] ) `shouldBe` Map.fromList [((0,0), Wall)]
      world ( parse ["##"] ) `shouldBe` Map.fromList [((0,0), Wall),((0,1), Wall)]
      world ( parse ["#", "#"] ) `shouldBe` Map.fromList [((0,0), Wall),((1,0), Wall)]
      player ( parse ["@"] ) `shouldBe` Just (0,0) 
