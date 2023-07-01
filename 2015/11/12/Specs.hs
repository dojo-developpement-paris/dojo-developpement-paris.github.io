import Test.Hspec
import GameOfLife

main = hspec $ do
  describe "nextGeneration" $ do
    it "should stay dead without neighbours" $ do
      nextGeneration [[Dead]] `shouldBe` [[Dead]]
      nextGeneration [[Dead, Dead]] `shouldBe` [[Dead, Dead]]
    it "should become dead without neighbours" $ do
      nextGeneration [[Alive]] `shouldBe` [[Dead]]
    it "should stay still if two neighbours alive" $ do
      nextGeneration [[Alive, Alive, Alive]] `shouldBe` [[Dead, Alive, Dead]]
      nextGeneration [[Alive, Alive, Alive, Alive]] `shouldBe` [[Dead, Alive, Alive, Dead]]
      nextGeneration [[Alive, Dead, Alive]] `shouldBe` [[Dead, Dead, Dead]]
    it "should see neighbour on other lines" $ do
      nextGeneration [[Alive, Alive]
                     ,[Alive, Alive]] `shouldBe`
                     [[Alive, Alive]
                     ,[Alive, Alive]]
      nextGeneration [[Dead,  Alive]
                     ,[Dead,  Alive]
                     ,[Dead,  Alive]] `shouldBe`
                     [[Dead,  Dead]
                     ,[Alive, Alive]
                     ,[Dead,  Dead]]
  describe "showBoard" $ do
    it "shows a board (with penguins ^^)" $ do
      showBoard [[Alive], [Dead]] `shouldBe` ["🐧","."]
