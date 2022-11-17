import Test.Hspec
import ShadokSum

main = hspec $ do
  describe "neutral element" $ do
    it "GA + GA should be GA" $ do
      [GA] `shSum` [GA] `shouldBe` [GA]

    it "GA + X should be X" $ do
      [GA] `shSum` [BU] `shouldBe` [BU]
      [GA] `shSum` [ZO] `shouldBe` [ZO]
      [GA] `shSum` [MEU] `shouldBe` [MEU]

    it "X + GA should be X" $ do
      [BU] `shSum` [GA] `shouldBe` [BU]
      [ZO] `shSum` [GA] `shouldBe` [ZO]
      [MEU] `shSum` [GA] `shouldBe` [MEU]
    
  describe "sum without carry" $ do
    it "BU + BU should be ZO" $ do
      [BU] `shSum` [BU] `shouldBe` [ZO]
    it "BU + ZO should be MEU" $ do
      [BU] `shSum` [ZO] `shouldBe` [MEU]
  
  describe "sum without carry" $ do
    it "ZO + BU should be MEU" $ do
      [ZO] `shSum` [BU] `shouldBe` [MEU]

  describe "sum with carry" $ do
    it "MEU + BU should be BU GA" $ do
      [MEU] `shSum` [BU] `shouldBe` [BU,GA]

    it "MEU + X should be [BU, pred X]" $ do
      [MEU] `shSum` [ZO] `shouldBe` [BU, BU]

    it "X + MEU should be [BU, pred X]" $ do
      [BU] `shSum` [MEU] `shouldBe` [BU, GA]

    it "ZO + ZO should be BU GA" $ do
      [ZO] `shSum` [ZO] `shouldBe` [BU, GA]

  describe "sum many number" $ do
    it "BUBUBU + ZOZOZO = MEUMEUMEU" $ do
      [BU, BU , BU] `shSum` [ZO, ZO, ZO] `shouldBe` [MEU, MEU, MEU]
    it "BUBUGA + ZOZOZO = MEUMEUZO" $ do
      [BU, BU , GA] `shSum` [ZO, ZO, ZO] `shouldBe` [MEU, MEU, ZO]
    it "BUBUGA + ZOZOBU = MEUMEUMBU" $ do
      [BU, BU , GA] `shSum` [ZO, ZO, BU] `shouldBe` [MEU, MEU, BU]
    it "GAGAGA + X = X" $ do
      [GA, GA, GA] `shSum` [ZO, ZO, ZO] `shouldBe` [ZO, ZO, ZO]
      
  describe "sum two digits number with single carry" $ do
    it "BUMEU + BUBU = MEUGA" $ do
      [BU, MEU] `shSum` [BU, BU] `shouldBe` [MEU, GA]
      [BU, MEU] `shSum` [GA, BU] `shouldBe` [ZO, GA]


