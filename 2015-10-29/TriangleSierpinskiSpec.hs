import Test.Hspec
import TriangleSierpinski

main = hspec $ do
  describe "Sierpinski triangle" $ do
    it "should work with depth 1" $ do
      sierpinskiTriangle 1 `shouldBe` [" 🐧 ",
                                       "🐧 🐧"]
      sierpinskiTriangle 2 `shouldBe` ["   🐧   ",
                                       "  🐧 🐧  ",
                                       " 🐧   🐧 ",
                                       "🐧 🐧 🐧 🐧"]
      sierpinskiTriangle 3 `shouldBe` ["       🐧       ",
                                       "      🐧 🐧      ",
                                       "     🐧   🐧     ",
                                       "    🐧 🐧 🐧 🐧    ",
                                       "   🐧       🐧   ",
                                       "  🐧 🐧     🐧 🐧  ",
                                       " 🐧   🐧   🐧   🐧 ",
                                       "🐧 🐧 🐧 🐧 🐧 🐧 🐧 🐧"]
