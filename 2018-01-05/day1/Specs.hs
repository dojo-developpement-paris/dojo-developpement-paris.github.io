import Test.Hspec
import Checksum

main = hspec $ do
  describe "checksum" $ do
    it "no element checksum is 0 " $ do
      checksum [] `shouldBe` 0

    it "a single element checksum is itself" $ do
      checksum [1] `shouldBe` 1
      checksum [2] `shouldBe` 2
    
    it "a two identical digits checksum is twice their value" $ do
      checksum [1, 1] `shouldBe` 2
      checksum [2, 2] `shouldBe` 4

    it "two different digits checksum is 0" $ do
      checksum [1, 2] `shouldBe` 0

    it "three different digits checksum is 0" $ do
      checksum [1, 2, 3] `shouldBe` 0
    
    it "two same first digits checksum is the same value" $ do
      checksum [2, 2, 3] `shouldBe` 2

    it "list is circular" $ do
      checksum [2, 3, 2] `shouldBe` 2

  describe "parse" $ do
    it "works, enjoy :)" $ do
      parse "123" `shouldBe` [1, 2, 3]
