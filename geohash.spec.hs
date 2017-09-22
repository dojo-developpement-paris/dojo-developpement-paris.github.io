import Test.Hspec

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

neighbours loc@"U" = [[(north . west) locBit], [north locBit], [(north.east) locBit]
                      ,[west locBit],                           [east locBit]
                      ,[(south . west) locBit],        "0", "1"] 
    where [locBit] = loc
neighbours [locBit] = map (\f -> (:[]) (f locBit)) 
                          [north . west, north, north.east
                          ,west,                east
                          ,south . west, south, south . east] 

north = pred . pred . pred . pred . pred . pred
west = pred
east = succ
south = succ . succ . succ . succ . succ . succ


