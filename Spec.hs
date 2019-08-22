import Test.Hspec
import Shadok

main = hspec $ do
    describe "sum shadoks" $ do
        it "GA + x = x" $ do
            [ GA ] `plus'` [ GA ] `shouldBe` [ GA ]
            [ GA ] `plus'` [ BU ] `shouldBe` [ BU ]
        it "x + GA = x" $ do
            [ BU ] `plus'` [ GA ] `shouldBe` [ BU ]
        it "BU + BU = ZO" $ do
            [ BU ] `plus'` [ BU ] `shouldBe` [ ZO ]
        it "BU + ZO = MEU" $ do
            [ BU ] `plus'` [ ZO ] `shouldBe` [ MEU ]
            [ ZO ] `plus'` [ BU ] `shouldBe` [ MEU ]
        it "MEU + BU = BU GA" $ do
            [ MEU ] `plus'` [ BU ] `shouldBe` [ BU, GA ]
        it "BU BU + BU = BU ZO" $ do
            [ BU, BU ] `plus'` [ BU ] `shouldBe` [ BU, ZO ]
        it "BU BU + ZO = BU MEU" $ do
            [ BU, BU ] `plus'` [ ZO ] `shouldBe` [ BU, MEU ]
        it "ZO + ZO = BU GA" $ do
            [ ZO ] `plus'` [ ZO ] `shouldBe` [ BU, GA ]
    