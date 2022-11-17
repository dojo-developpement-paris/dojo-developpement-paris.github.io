import Test.Hspec
import Control.Applicative ((<*>))
import Data.Char


main = hspec $ do
  describe "neighbours of a cell" $ do
    it "example: neighbours of O" $ do
      neighbours "O" `shouldBe` ["H", "I", "J"
                                ,"N",      "P"
                                ,"T", "U", "V"] 
    it "example: neighbours of U" $ do
      neighbours "U" `shouldBe` ["N", "O", "P"
                                ,"T",      "V"
                                ,"Z", "0", "1"] 

neighbours cell = map return $ map to $ 
                          [north . west, north, north.east
                          ,west,                east
                          ,south . west, south, south . east] <*> cell

to numChar | numChar > 'Z' = chr (ord numChar - ord 'Z' + ord '0' - 1)
to char = char

north = pred . pred . pred . pred . pred . pred
west = pred
east = succ
south = succ . succ . succ . succ . succ . succ

