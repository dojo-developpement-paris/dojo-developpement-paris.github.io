import Test.Hspec

import Gof 

main = hspec $ do
  describe "cell printer" $ do
    it "alive cell print as a circle" $ do
      cellFormat [[Alive]]  `shouldBe` "o"
    it "two consecutive cells print as oo" $ do
      cellFormat [[Alive, Alive]]  `shouldBe` "oo"
    it "two non-consecutive cells print as o o" $ do
      cellFormat [[Alive, Dead, Alive]]  `shouldBe` "o o"
    it "Multiline" $ do
      cellFormat [[Alive],[Alive]]  `shouldBe` "o\no"
      cellFormat [[Alive],[Dead],[Alive]]  `shouldBe` "o\n \no"
  describe "next" $ do
    it "calculates the next step" $ do
      next flip' `shouldBe` flop'
      next flop' `shouldBe` flip'

