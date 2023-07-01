import Test.Hspec
import TrianglePascal

main = hspec $ do
  describe "Triangle de Pascal" $ do
    it "should work with depth 1" $ do
      pascalTriangle 1 `shouldBe` [[1]]
      pascalTriangle 2 `shouldBe` [[1],
                                   [1,1]]
      pascalTriangle 3 `shouldBe` [[1],
                                   [1,1],
                                   [1,2,1]]
